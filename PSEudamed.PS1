# verschiedene Powershell-Funktionen um die Eudamed abfragen zu können

Function Get-EudamedPagedData {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory)]
        [String]$Url,
        [switch]$OnlyTotalElements
    )

    $page=0
    $pages=1
    If ($OnlyTotalElements) {
        $size = 1  # Daten auf ein Minimum reduzieren, kleiner 1 geht scheinbar nicht
    } else {
        $size=300  # scheinbar gehen nicht mehr als 300 maximal
    }
    $last=$false
    while (-Not $last) {
        If ($Url -match '\?') {
            $r=Invoke-WebRequest "$Url&page=$page&pageSize=$size&size=$size"
        } else {
            $r=Invoke-WebRequest "$($Url)?page=$page&pageSize=$size&size=$size"
        }
        $j=Convertfrom-json $r.content
        If ($j.number -eq 0) {
            Write-Verbose "TotalPages: $($j.totalPages)"
            Write-Verbose "TotalElements: $($j.totalElements)"
            $Pages = $j.totalPages
        }
        Write-Verbose "Page: $($j.number+1)/$Pages"
        $last=$j.last
        $page++
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

Function Get-EudamedEODetail {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory)]
        [String]$Uuid
    )
    
    $Url = "https://ec.europa.eu/tools/eudamed/api/actors/$Uuid/publicInformation?languageIso2Code=en"
    $r=Invoke-WebRequest "$Url&page=$page&pageSize=$size&size=$size"
    ConvertFrom-Json $r.Content
}

Function Get-EudamedDevicesOfEO {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory)]
        [String]$Srn
    )
    
    $Url = "https://ec.europa.eu/tools/eudamed/api/devices/udiDiData?iso2Code=en&srn=$srn&deviceStatusCode=refdata.device-model-status.on-the-market&languageIso2Code=de"
    Get-EudamedPagedData -Url $Url
}

Function Get-EudamedDeviceDetail {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory)]
        [String]$Uuid
    )
    
    $Url = "https://ec.europa.eu/tools/eudamed/api/devices/udiDiData/$($Uuid)?languageIso2Code=de"
    Write-Verbose "Url: $Url"
    $r=Invoke-WebRequest $Url
    ConvertFrom-Json $r.Content
}

Function Get-EudamedEmdn {
    [CmdletBinding()]
    Param(
    )
    
    $Url = "https://webgate.ec.europa.eu/dyna2/emdn/api/nomenclature?id=%23"
    Write-Verbose "Url: $Url"
    $r=Invoke-WebRequest $Url
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

# ermittelt alle Economic Operators, dauert...
$AlleEOs = "https://ec.europa.eu/tools/eudamed/api/eos?rnd=1665398393978&sort=srn%2CASC&sort=versionNumber%2CDESC&languageIso2Code=de"
$EOdata=Get-EudamedPagedData $AlleEOs
$EOdata|select srn, name, @{N='Registrierdatum'; E={Get-Date ($_.dateOfRegistration)}}, electronicMail, telephone, rolename| sort-Object Registrierdatum | select -Last 30 |ft

# ermittelt die EOs nur aus Österreich
$EOATdata = Get-EudamedPagedDataCountry -Url $AlleEOs -Country 'AT'
$EOATdata|select srn, name, @{N='Registrierdatum'; E={Get-Date ($_.dateOfRegistration)}}, electronicMail, telephone, rolename| sort-Object Registrierdatum | select -Last 30 |ft

# Detaildaten eines Economic Operators ausgeben anhand dessen Uuid
$am=Get-EudamedEODetail -Uuid 6bb2017f-b4df-452f-9799-798f063f535d
$am.actorDataPublicView

# Die Devices des obigen EOs ermitteln
$AGDevices=Get-EudamedDevicesOfEO -Srn $am.actorDataPublicView.eudamedIdentifier

# Die UDI-DI eines Devices ermitteln
(Get-EudamedDeviceDetail -uuid $AGDevices[0].uuid).primaryDi.code

# Dental (Q) Devices ermitteln:
$emdn = Get-EudamedEmdn
$emdn[13].children[0].children

# Beispiel CNDs:
# Q010601 umfasst: Legierungen
# Q010699 umfasst: Dentine, Liner
# Q01020601 umfasst: Zähne
# P01020101 umfasst: Implantate

# Legierungen ermitteln
$alloy = Get-EudamedDevicesOfCND -CndCode Q010601
$alloy.Length

# Zähne ermitteln
$teeth = Get-EudamedDevicesOfCND -CndCode Q01020601
$teeth.Length

# Dentin usw. ermitteln
$dent = Get-EudamedDevicesOfCND -CndCode Q010699
$dent.Length

# Implantate ermitteln
$implants = Get-EudamedDevicesOfCND -CndCode P01020101
$implants.Length

# alle CNDs mit Dental ermitteln:
$emdn = Get-EudamedEmdn
$ms = Get-EudamedEmdnSearch -emdn $emdn -text dental
$ms.Length

"Ende erreicht"
