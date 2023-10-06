# verschiedene Powershell-Funktionen um die Eudamed abfragen zu können

Function Set-Culture([System.Globalization.CultureInfo] $culture)
{
    [System.Threading.Thread]::CurrentThread.CurrentUICulture = $culture
    [System.Threading.Thread]::CurrentThread.CurrentCulture = $culture
}

Function Get-EudamedPagedData {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory)]
        [String]$Url,
        [switch]$OnlyTotalElements
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
        $r=Invoke-WebRequest $NewUrl -UseBasicParsing
        $j=Convertfrom-json $r.content
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
            $j.content
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

Function Get-EudamedCertificates {
    [CmdletBinding()]
    Param()

	# mögliche Parameter: entityTypeCode=certificate.certificates
	$Url = 'https://ec.europa.eu/tools/eudamed/api/certificates/search/?languageIso2Code=de'

    Get-EudamedPagedData -Url "$Url"

}

# Uuid liefert mehr Informationen
Function Get-EudamedCertificateDetail {
    [CmdletBinding()]
    Param(
        [Parameter(ParameterSetName='Uuid',Position=0,ValueFromPipelineByPropertyName,Mandatory)]
        [String]$Uuid
    )

    Process {
      If ($PSCmdlet.ParameterSetName -eq 'Uuid') {
          $Url = "https://ec.europa.eu/tools/eudamed/api/certificates/$Uuid/?languageIso2Code=de"
      }
      $r=Invoke-WebRequest "$Url" -UseBasicParsing
      If ($PSCmdlet.ParameterSetName -eq 'Uuid') {
	      ConvertFrom-Json $r.Content
      } else {
	      # (ConvertFrom-Json $r.Content).Content  # Irgendwie nochmal geschachtelt, können srn Wildcards enthalten?!?!?
      }
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

# ermittelt die Devices eines Herstellers nach seinem Namen, wenn der Name auf mehrere Hersteller zutrifft, werden Materialien von verschiedenen Herstellern zurückgegebn
Function Get-EudamedEODevicesByManufacturerName {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory,ParameterSetName='Manufacturer',Position=0)]
        [String]$ManufacturerName
    )

    $Url = "https://ec.europa.eu/tools/eudamed/api/devices/udiDiData?manufacturerName=$($ManufacturerName)&languageIso2Code=de"
    Get-EudamedPagedData -Url $Url
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
        $Url = "https://ec.europa.eu/tools/eudamed/api/eos?srn=$($srn)&languageIso2Code=de"
    }
    $r=Invoke-WebRequest "$Url" -UseBasicParsing
    If ($PSCmdlet.ParameterSetName -eq 'Uuid') {
	    ConvertFrom-Json $r.Content
	} else {
	    (ConvertFrom-Json $r.Content).Content  # Irgendwie nochmal geschachtelt, können srn Wildcards enthalten?!?!?
	}
}

Function Get-EudamedDevicesOfEO {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory,ValueFromPipelineByPropertyName)]
        [String]$Srn
    )
    
    Process {
    	$Url = "https://ec.europa.eu/tools/eudamed/api/devices/udiDiData?iso2Code=en&srn=$srn&deviceStatusCode=refdata.device-model-status.on-the-market&languageIso2Code=de"
    	Get-EudamedPagedData -Url $Url
    }
}

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
    	Write-Verbose "Url: $Url"
    	$r=Invoke-WebRequest $Url -UseBasicParsing
    	ConvertFrom-Json $r.Content
    }
}

Function Get-EudamedEmdn {
    [CmdletBinding()]
    Param(
    )
    
    $Url = "https://webgate.ec.europa.eu/dyna2/emdn/api/nomenclature?id=%23"
    Write-Verbose "Url: $Url"
    $r=Invoke-WebRequest $Url -UseBasicParsing
    ConvertFrom-Json $r.Content
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
    $r=Invoke-WebRequest -Uri $url -UseBasicParsing
    $r.Content
    
}
