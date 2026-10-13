# verschiedene Powershell-Funktionen um die Eudamed abfragen zu können

Function Set-Culture([System.Globalization.CultureInfo] $culture)
{
    [System.Threading.Thread]::CurrentThread.CurrentUICulture = $culture
    [System.Threading.Thread]::CurrentThread.CurrentCulture = $culture
}

function Invoke-EudamedRestRequest {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [uri] $Uri,

        [ValidateRange(1, 20)]
        [int] $MaxAttempts = 5,

        [ValidateRange(0, 3600)]
        [int] $RequestTimeoutSeconds = 180,

        [ValidateRange(0, 3600)]
        [int] $ReadTimeoutSeconds = 60
    )

    # HTTP-Statuscodes, bei denen eine Wiederholung sinnvoll sein kann.
    $retryableStatusCodes = @(
        408, # Request Timeout
        425, # Too Early
        429, # Too Many Requests
        500, # Internal Server Error
        502, # Bad Gateway
        503, # Service Unavailable
        504  # Gateway Timeout
    )

    # Wartezeiten nach dem ersten, zweiten, dritten und vierten Fehler.
    $retryDelays = @(5, 15, 30, 60)

    for ($attempt = 1; $attempt -le $MaxAttempts; $attempt++) {
        $stopwatch = [System.Diagnostics.Stopwatch]::StartNew()

        try {
            Write-Verbose (
                'HTTP START attempt={0}/{1} uri="{2}"' -f
                    $attempt,
                    $MaxAttempts,
                    $Uri
            )

            $result = Invoke-RestMethod `
                -Uri $Uri `
                -Method Get `
                -ConnectionTimeoutSeconds $RequestTimeoutSeconds `
                -OperationTimeoutSeconds $ReadTimeoutSeconds `
                -ErrorAction Stop

            $stopwatch.Stop()

            Write-Verbose (
                'HTTP OK attempt={0}/{1} durationMs={2} uri="{3}"' -f
                    $attempt,
                    $MaxAttempts,
                    $stopwatch.ElapsedMilliseconds,
                    $Uri.AbsoluteUri
            )

            return $result
        }
        catch {
            $stopwatch.Stop()

            $statusCode = $null

            if (
                $null -ne $_.Exception.Response -and
                $null -ne $_.Exception.Response.StatusCode
            ) {
                $statusCode = [int] $_.Exception.Response.StatusCode
            }

            # Je nach PowerShell-/NET-Version kann ein Timeout als
            # TaskCanceledException, HttpRequestException oder über
            # die Fehlermeldung sichtbar werden.
            $isTimeout =
                $_.Exception -is [System.Threading.Tasks.TaskCanceledException] -or
                $_.Exception.InnerException -is [System.Threading.Tasks.TaskCanceledException] -or
                $_.Exception.Message -match
                    '(?i)timeout|timed out|HttpClient\.Timeout|request was canceled'

            $isRetryableHttpError =
                $null -ne $statusCode -and
                $statusCode -in $retryableStatusCodes

            $canRetry =
                ($isTimeout -or $isRetryableHttpError) -and
                $attempt -lt $MaxAttempts

            Write-Warning (
				(
                'HTTP ERROR attempt={0}/{1} durationMs={2} ' +
                'status={3} timeout={4} retry={5} message="{6}" uri="{7}"'
				) -f
                $attempt,
                $MaxAttempts,
                $stopwatch.ElapsedMilliseconds,
                $(if ($null -eq $statusCode) { 'none' } else { $statusCode }),
                $isTimeout,
                $canRetry,
                $_.Exception.Message.Replace('"', "'"),
                $Uri.AbsoluteUri
            )

            if (-not $canRetry) {
                throw
            }

            $delaySeconds = $retryDelays[
                [Math]::Min(
                    $attempt - 1,
                    $retryDelays.Count - 1
                )
            ]

            # Kleine Zufallskomponente, damit parallele Jobs nicht
            # gleichzeitig erneut auf den Server zugreifen.
            $delaySeconds += Get-Random -Minimum 0 -Maximum 4

            Write-Verbose (
                'HTTP RETRY attempt={0}/{1} waitSeconds={2} uri="{3}"' -f
                    ($attempt + 1),
                    $MaxAttempts,
                    $delaySeconds,
                    $Uri.AbsoluteUri
            )

            Start-Sleep -Seconds $delaySeconds
        }
    }

    throw "Unerwartetes Ende der Retry-Schleife für $Uri"
}

Function Get-EudamedPagedData {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory)]
        [String]$Url,
        [switch]$OnlyTotalElements,
	[switch]$JsonDirect
    )

    $page=0
    $pages=1
    $waitAfterPages=100
    If ($OnlyTotalElements) {
        $size = 1  # Daten auf ein Minimum reduzieren, kleiner 1 geht scheinbar nicht
    } else {
        $size=300  # scheinbar gehen nicht mehr als 300 maximal
    }
    $last=$false
    while (-Not $last) {
        If ($Url -match '\?') {
            $NewUrl="$Url&page=$page&pageSize=$size&size=$size"
        } else {
            $NewUrl="$($Url)?page=$page&pageSize=$size&size=$size"
        }
        Write-Verbose "Aufruf: $NewUrl"
        # $r=Invoke-WebRequest $NewUrl -UseBasicParsing
        # $j=Convertfrom-json $r.content
        # $j = Invoke-RestMethod -Uri $newUrl -ConnectionTimeoutSeconds 30 -OperationTimeoutSeconds 180
		$j = Invoke-EudamedRestRequest -Uri $newUrl -MaxAttempts 5 -RequestTimeoutSeconds 180 -ReadTimeoutSeconds 60
		If ($j.number -eq 0) {
            Write-Verbose "TotalPages: $($j.totalPages)"
            Write-Verbose "TotalElements: $($j.totalElements)"
            $Pages = $j.totalPages
        }
        Write-Verbose "Page: $($j.number+1)/$Pages"
        $last=$j.last
        $page++
	If (($WaitAfterPages -gt 0) -and ($page%$WaitAfterPages -eq 0)) {
		Start-Sleep -Seconds 1
	}
        If ($OnlyTotalElements) {
            $j.totalElements
            $last = $true
        } else {
		If ($JsonDirect) {
			$j
		} else {
            		$j.content
		}
        }
    }
}

Function Get-EudamedPagedDataCountry {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory)]
        [String]$Url,
        [String]$Country='DE'
    )

    Get-EudamedPagedData -Url "$Url&countryIso2Code=$Country"
}

Function Get-EudamedEO {
    [CmdletBinding()]
    Param()

	# mögliche Parameter: entityTypeCode=certificate.certificates
	$Url = 'https://ec.europa.eu/tools/eudamed/api/eos/?languageIso2Code=de'

    Get-EudamedPagedData -Url "$Url"

}

Function Get-EudamedNotifiedBodies {
    [CmdletBinding()]
    Param()

	# mögliche Parameter: entityTypeCode=certificate.certificates
	$Url = 'https://ec.europa.eu/tools/eudamed/api/ses/notifiedBodies?languageIso2Code=de'

	Get-EudamedPagedData -Url "$Url" -JsonDirect

}

Function Get-EudamedCertificates {
    [CmdletBinding()]
    Param(
        [Parameter(ParameterSetName='NotifiedBodySrn',Position=0,ValueFromPipelineByPropertyName,Mandatory=$false)]
        [String]$NotifiedBodySrn

    )

	# mögliche Parameter: entityTypeCode=certificate.certificates
	If ($NotifiedBodySrn) {
		$Url = "https://ec.europa.eu/tools/eudamed/api/certificates/search/?languageIso2Code=de&notifiedBodySrn=$NotifiedBodySrn"
	} else {
		$Url = 'https://ec.europa.eu/tools/eudamed/api/certificates/search/?languageIso2Code=de'
	}

    Get-EudamedPagedData -Url "$Url"

}

# Uuid liefert mehr Informationen
Function Get-EudamedCertificateDetail {
    [CmdletBinding()]
    Param(
        [Parameter(
            ParameterSetName='Uuid',
            Position=0,
            ValueFromPipelineByPropertyName,
            Mandatory
        )]
        [String]$Uuid
    )

    Process {
        $Url = "https://ec.europa.eu/tools/eudamed/api/certificates/$Uuid/?languageIso2Code=de"

        Write-Verbose "Url: $Url"

        Invoke-EudamedRestRequest -Uri $Url `
            -MaxAttempts 5 `
            -RequestTimeoutSeconds 180 `
            -ReadTimeoutSeconds 60
    }
}

# Uuid muss eine Document UUID sein (z. B. von CertificateDetail)
Function Get-EudamedCertificateDownload {
    [CmdletBinding()]
    Param(
        [Parameter(ParameterSetName='Uuid',Position=0,Mandatory)]
        [String]$Uuid,
        [Parameter(ParameterSetName='Uuid',Position=1)]
	[Switch]$SaveFile,
        [Parameter(ParameterSetName='Uuid',Position=2)]
	[String]$Path
    )

    If ($PSCmdlet.ParameterSetName -eq 'Uuid') {
        $Url = "https://ec.europa.eu/tools/eudamed/api/documents/$Uuid/?languageIso2Code=de"
    }
    If ($SaveFile) {
    	$Parameter = @{OutFile=$Path}
    } else {
    	$Parameter = @{}
    }
    $r=Invoke-WebRequest "$Url" -UseBasicParsing @Parameter
    If ($PSCmdlet.ParameterSetName -eq 'Uuid') {
    		If (-Not ($SaveFile)) {
	    		$r.Content
		}
	} else {
	    # (ConvertFrom-Json $r.Content).Content  # Irgendwie nochmal geschachtelt, können srn Wildcards enthalten?!?!?
	}
}


Function Get-EudamedPagedDataCountryAndRole {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory)]
        [String]$Url,
        [String]$Country='DE',
        [ValidateSet('Manufacturer', 'Authorised-Representative', 'System-Procedure-Pack-Producer', 'Importer')]
        [String]$Role='Manufacturer'
    )

    switch ($Role) {
        'Manufacturer'              {$atc = 'actorTypeCode=refdata.actor-type.manufacturer'}
        'Authorised-Representative' {$atc = 'actorTypeCode=refdata.actor-type.authorised-representative'}
        'System-Procedure-Pack-Producer'    {$atc = 'actorTypeCode=refdata.actor-type.system-procedure-pack-producer'}
        'Importer'                  {$atc = 'actorTypeCode=refdata.actor-type.importer'}
    }
    Get-EudamedPagedData -Url "$Url&$atc&countryIso2Code=$Country"
}

# Regressionstest: die bisherige breite und potentiell langsame Device-Suche.
# ACHTUNG: Der API-Parameter 'name' ist kein reiner Herstellerfilter.
Function Get-EudamedEODevicesByManufacturerNameRegression {
	[CmdletBinding()]
    Param(
        [Parameter(Mandatory)]
		[ValidateNotNullOrEmpty()]
        [String]$ManufacturerName,

        [switch]$OnlyTotalElements
    )

	$encodedName = [System.Uri]::EscapeDataString($ManufacturerName)

    $Url = "https://ec.europa.eu/tools/eudamed/api/devices/udiDiData?name=$encodedName&languageIso2Code=de"

    Get-EudamedPagedData `
        -Url $Url `
        -OnlyTotalElements:$OnlyTotalElements
}

# Herstellersuche in zwei unabhaengigen HTTP-Phasen:
#  1. Suche der Manufacturer-Actors per Namensteil, mit Pagination.
#  2. Erneute Device-Abfrage fuer jede eindeutige Manufacturer-SRN, mit Pagination.
# Signatur/Rueckgabetyp wie bisher: Anzahl (eine Zahl) oder Device-Objekte.
# Kein on-the-market-Filter, damit der Vergleich zur Regression fair bleibt.
Function Get-EudamedEODevicesByManufacturerName {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [String]$ManufacturerName,

        [switch]$OnlyTotalElements
    )

    $search = $ManufacturerName.Trim()
    if ([String]::IsNullOrWhiteSpace($search)) {
        throw 'ManufacturerName darf nicht nur Leerzeichen enthalten.'
    }

    $encodedName = [System.Uri]::EscapeDataString($search)
    $actorUrl = 'https://ec.europa.eu/tools/eudamed/api/eos' +
        "?name=$encodedName" +
        '&actorTypeCode=refdata.actor-type.manufacturer' +
        '&languageIso2Code=de'

    # EUDAMED wird erneut abgefragt: KEIN Zugriff auf zuvor geladene Devices.
    $actors = @(Get-EudamedPagedData -Url $actorUrl)
    $actorMatches = @($actors | Where-Object {
        ([string]$_.name).IndexOf($search, [StringComparison]::OrdinalIgnoreCase) -ge 0
    })

    # Manche API-Suchen verarbeiten Sonderzeichen im vollen Namen
    # nicht konsistent. In dem Fall mit einem markanten Namensteil
    # erneut bei EUDAMED suchen und die volle Zeichenkette lokal pruefen.
    if ($actorMatches.Count -eq 0) {
        $tokens = @(
            [regex]::Matches($search, '[\p{L}\p{N}]{3,}') |
                ForEach-Object { $_.Value } |
                Sort-Object Length -Descending
        )
        if ($tokens.Count -gt 0 -and $tokens[0] -ine $search) {
            $fallback = [System.Uri]::EscapeDataString($tokens[0])
            $fallbackUrl = 'https://ec.europa.eu/tools/eudamed/api/eos' +
                "?name=$fallback" +
                '&actorTypeCode=refdata.actor-type.manufacturer' +
                '&languageIso2Code=de'
            Write-Verbose "Actor-Fallback mit Namensteil '$($tokens[0])'"
            $actors = @(Get-EudamedPagedData -Url $fallbackUrl)
            $actorMatches = @($actors | Where-Object {
                ([string]$_.name).IndexOf($search, [StringComparison]::OrdinalIgnoreCase) -ge 0
            })
        }
    }

    $srns = [System.Collections.Generic.HashSet[string]]::new(
        [StringComparer]::OrdinalIgnoreCase
    )
    $matchingActors = 0

    foreach ($actor in $actorMatches) {
        # Zweite Kontrolle: ein von der API unerwartet breiter Treffer
        # soll die nachfolgende SRN-Abfrage nicht verfaelschen.
        $actorName = [string]$actor.name
        if ($actorName.IndexOf($search, [StringComparison]::OrdinalIgnoreCase) -lt 0) {
            continue
        }
        $matchingActors++

        $srn = [string]$actor.srn
        if ([String]::IsNullOrWhiteSpace($srn)) {
            $srn = [string]$actor.eudamedIdentifier
        }
        if ([String]::IsNullOrWhiteSpace($srn)) {
            throw "Actor '$actorName' hat weder srn noch eudamedIdentifier."
        }
        if ($srn -notmatch '^[A-Z]{2}-MF-') {
            throw "Unerwartete Hersteller-SRN '$srn' fuer Actor '$actorName'."
        }

        [void]$srns.Add($srn)
    }

    if ($matchingActors -eq 0) {
        Write-Verbose "Keine Manufacturer-Actors fuer '$search' gefunden."
        if ($OnlyTotalElements) { return [long]0 }
        return
    }

    Write-Verbose "Manufacturer-Actors=$matchingActors eindeutige SRNs=$($srns.Count)"
    $total = [long]0

    foreach ($srn in $srns) {
        $encodedSrn = [System.Uri]::EscapeDataString($srn)
        $deviceUrl = 'https://ec.europa.eu/tools/eudamed/api/devices/udiDiData' +
            "?srn=$encodedSrn&languageIso2Code=de"

        if ($OnlyTotalElements) {
            # Je SRN eigener LIVE-Aufruf. Ein Fehler wird bewusst
            # weitergereicht, niemals in eine falsche Null umgewandelt.
            $count = [long](Get-EudamedPagedData -Url $deviceUrl -OnlyTotalElements)
            Write-Verbose "SRN=$srn totalElements=$count"
            $total += $count
        }
        else {
            # Vollstaendiger erneuter Download aller Seiten jeder SRN.
            Get-EudamedPagedData -Url $deviceUrl
        }
    }

    if ($OnlyTotalElements) {
        return $total
    }
}

# Achtung die unterschiedlichen ParameterSets liefern unterschiedliche, nicht kompatible Strukturen zurück
# Uuid liefert mehr Informationen
Function Get-EudamedEODetail {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory,ParameterSetName='Uuid',Position=0)]
        [String]$Uuid,
        [Parameter(Mandatory,ParameterSetName='Srn',Position=0)]
        [String]$Srn
    )

    If ($PSCmdlet.ParameterSetName -eq 'Uuid') {
        $Url = "https://ec.europa.eu/tools/eudamed/api/actors/$Uuid/publicInformation?languageIso2Code=de"
    } else {
        # ParameterSet Srn
        $Url = "https://ec.europa.eu/tools/eudamed/api/eos?srn=$($Srn)&languageIso2Code=de"
    }

    Write-Verbose "Url: $Url"

    $j = Invoke-EudamedRestRequest -Uri $Url `
        -MaxAttempts 5 `
        -RequestTimeoutSeconds 180 `
        -ReadTimeoutSeconds 60

    If ($PSCmdlet.ParameterSetName -eq 'Uuid') {
        $j
    } else {
        $j.Content
    }
}

Function Get-EudamedDevicesOfEO {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory,ValueFromPipelineByPropertyName)]
        [String]$Srn,
	[switch]$OnlyTotalElements
    )
    
    Process {
    	$Url = "https://ec.europa.eu/tools/eudamed/api/devices/udiDiData?iso2Code=en&srn=$srn&deviceStatusCode=refdata.device-model-status.on-the-market&languageIso2Code=de"
    	Get-EudamedPagedData -Url $Url -OnlyTotalElements:$OnlyTotalElements
    }
}

# ermittelt alle Devices oder die Anzahl davon
Function Get-EudamedDevices {
    [CmdletBinding()]
    Param(
	[String]$Name,
	[String]$DeviceModel,
	[switch]$OnlyTotalElements
    )
    
    Process {
	$search = ""
	If ($Name) {
		$search += "&tradeName=$Name"
	}
	If ($DeviceModel) {
		$search += "&deviceModel=$DeviceModel"
	}
    	$Url = "https://ec.europa.eu/tools/eudamed/api/devices/udiDiData?iso2Code=en&deviceStatusCode=refdata.device-model-status.on-the-market&languageIso2Code=de$search"
Write-Host $url
    	Get-EudamedPagedData -Url $Url -OnlyTotalElements:$OnlyTotalElements
    }
}

# Issue #2 beachten wegen Unterschiede beim Resultset! https://github.com/Delapro/EUDAMED/issues/2
Function Get-EudamedDeviceDetail {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory,ValueFromPipelineByPropertyName,ParameterSetName='Uuid',Position=0)]
        [String]$Uuid,
        [Parameter(Mandatory,ValueFromPipelineByPropertyName,ParameterSetName='PrimaryDI',Position=0)]
        [String]$PrimaryDI
    )
    
    Process {
    	If ($PSCmdlet.ParameterSetName -eq 'Uuid') {    
			$Url = "https://ec.europa.eu/tools/eudamed/api/devices/udiDiData/$($Uuid)?languageIso2Code=de"
		} else {
			# primaryDI-Set
			$Url = "https://ec.europa.eu/tools/eudamed/api/devices/udiDiData?primaryDi=$([System.Web.HttpUtility]::UrlEncode($PrimaryDI))&languageIso2Code=de"
		}

		Invoke-EudamedRestRequest -Uri $Url `
    		-MaxAttempts 5 `
    		-RequestTimeoutSeconds 180 `
    		-ReadTimeoutSeconds 60
	}
}

Function Get-EudamedEmdn {
    [CmdletBinding()]
    Param(
    )
    
    $Url = "https://webgate.ec.europa.eu/dyna2/emdn/api/nomenclature?id=%23"
    Write-Verbose "Url: $Url"

	Invoke-EudamedRestRequest -Uri $Url `
    	-MaxAttempts 5 `
    	-RequestTimeoutSeconds 180 `
    	-ReadTimeoutSeconds 60
}

Function Get-EudamedEmdnSearch {
    [CmdletBinding()]
    Param(
        [Object]$emdn,
        [String]$text
    )
    
    foreach ($entry in $emdn) {
        If ($entry.text -match $text) {
            [PSCustomObject]@{CndCode=($entry.id -replace 'node_',''); Text=$entry.text -replace "$($entry.id -replace 'node_','') - ", ''}
        }
        If ($entry.children.Count -gt 0) {
            Get-EudamedEmdnSearch $entry.children -text $text
        }
    }
}

Function Get-EudamedDevicesOfCND {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory)]
        [String]$CndCode
    )
    
    $url = "https://ec.europa.eu/tools/eudamed/api/devices/udiDiData?iso2Code=en&cndCode=$CndCode&deviceStatusCode=refdata.device-model-status.on-the-market&languageIso2Code=de"
    Get-EudamedPagedData -Url $Url
}

Function Get-EudamedVersion {
    [CmdletBinding()]
    Param(
    )
    
    $url = "https://ec.europa.eu/tools/eudamed/api/applicationInfo"
	Invoke-EudamedRestRequest -Uri $url `
    	-MaxAttempts 5 `
    	-RequestTimeoutSeconds 180 `
    	-ReadTimeoutSeconds 60
}
