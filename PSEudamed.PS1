# verschiedene Powershell-Funktionen um die Eudamed abfragen zu können

Function Get-EudamedPagedData {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory)]
        [String]$Url
    )

    $page=0
    $size=300  # scheinbar gehen nicht mehr als 300 maximal
    $last=$false
    while (-Not $last) {
        $r=Invoke-WebRequest "$Url&page=$page&pageSize=$size&size=$size"
        $j=Convertfrom-json $r.content
        $last=$j.last
        $page++
        $j.content
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

"Ende erreicht"
