# sicherstellen, dass die Datumsausgaben im bekannten Format stattfinden
Set-Culture('de-DE')

# ermittelt alle Economic Operators, dauert...
$AlleEOs = "https://ec.europa.eu/tools/eudamed/api/eos?rnd=1665398393978&sort=srn%2CASC&sort=versionNumber%2CDESC&languageIso2Code=de"
# alte Variante
# $EOdata=Get-EudamedPagedData $AlleEOs
# $EOdata|select srn, name, @{N='Registrierdatum'; E={Get-Date ($_.dateOfRegistration)}}, electronicMail, telephone, rolename| sort-Object Registrierdatum | select -Last 30 |ft

"nochmal"
$EOdata=Get-EudamedEO
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

# Erkodent-Devices ermitteln:
Get-EudamedEODetail -Srn DE-MF-000006243|Get-EudamedDevicesOfEO|select uuid, primarydi, tradename

# Erkodentbeispiel mit Sprachen und Erläuterungen:
(Get-EudamedDeviceDetail -Uuid 69d78b02-bcc2-46ab-a560-faec2b248689).tradename.texts
(Get-EudamedDeviceDetail -Uuid 69d78b02-bcc2-46ab-a560-faec2b248689).additionaldescription.texts
(Get-EudamedDeviceDetail -Uuid 39cf1a88-5310-48d5-97b6-cf667ca007ee).tradename.texts
(Get-EudamedDeviceDetail -Uuid 39cf1a88-5310-48d5-97b6-cf667ca007ee).additionaldescription.texts

"" # Leerzeile

$DofEO = Get-EudamedEODevicesByManufacturerName -ManufacturerName Erko
"Anzahl Devices von Manufacturer 'Erko': $($DofEO.Length)"
"" # Leerzeile

"Eudamed Versioninfos:"
Get-EudamedVersion

"Ende erreicht"
