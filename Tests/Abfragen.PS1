# sicherstellen, dass die Datumsausgaben im bekannten Format stattfinden
Set-Culture('de-DE')

# ermittelt alle Economic Operators, dauert...
$AlleEOs = "https://ec.europa.eu/tools/eudamed/api/eos?rnd=1665398393978&sort=srn%2CASC&sort=versionNumber%2CDESC&languageIso2Code=de"
$EOdata=Get-EudamedPagedData $AlleEOs
$EOdata|select srn, name, @{N='Registrierdatum'; E={Get-Date ($_.dateOfRegistration)}}, electronicMail, telephone, rolename| sort-Object Registrierdatum | select -Last 30 |ft

# ermittelt die EOs nur aus Österreich
$EOATdata = Get-EudamedPagedDataCountry -Url $AlleEOs -Country 'AT'
$EOATdata|select srn, name, @{N='Registrierdatum'; E={Get-Date ($_.dateOfRegistration)}}, electronicMail, telephone, rolename| sort-Object Registrierdatum | select -Last 30 |ft

# ermittelt die EOs aus Deutschland allerdings nur Hersteller
$EODEdata = Get-EudamedPagedDataCountryAndRole  -Url $AlleEOs -Country 'DE' -Role 'Manufacturer'
$EODEdata|select srn, name, @{N='Registrierdatum'; E={Get-Date ($_.dateOfRegistration)}}, electronicMail, telephone, rolename| sort-Object Registrierdatum | select -Last 30 |ft
"Hersteller aus Deutschland: $($EODEdata.Length)"

# Detaildaten eines Economic Operators ausgeben anhand Srn
$am=Get-EudamedEODetail -Srn DE-MF-000030326
$am.actorDataPublicView

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

$totalDevices = Get-EudamedPagedData -Url 'https://ec.europa.eu/tools/eudamed/api/devices/udiDiData' -OnlyTotalElements
"Devices Gesamtanzahl: $totalDevices"

# Legierungen ermitteln
$alloy = Get-EudamedDevicesOfCND -CndCode Q010601
"Legierungen: $($alloy.Length)"

# Zähne ermitteln
$teeth = Get-EudamedDevicesOfCND -CndCode Q01020601
"Zähne: $($teeth.Length)"

# Dentin usw. ermitteln
$dent = Get-EudamedDevicesOfCND -CndCode Q010699
"Dentin usw.: $($dent.Length)"

# Implantate ermitteln
$implants = Get-EudamedDevicesOfCND -CndCode P01020101
"Implantatteile: $($implants.Length)"

# alle CNDs mit Dental ermitteln:
$emdn = Get-EudamedEmdn
$ms = Get-EudamedEmdnSearch -emdn $emdn -text dental
"CNDs mit dental im Namen: $($ms.Length)"

"Eudamed Versioninfos:"
Get-EudamedVersion

"Ende erreicht"