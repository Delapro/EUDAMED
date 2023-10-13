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

# hier eine Liste aller bei HIBC registrierten Dentalhersteller: https://www.hibcc.org/wp-content/uploads/Current-HIBC-Dental-Labelers.pdf
# Link für EO-Suche: https://ec.europa.eu/tools/eudamed/#/screen/search-eo
$hersteller=@('DE-MF-000007705', 'DE-IM-000006314', 'DE-MF-000007706', 'DE-MF-000023384', 'DE-MF-000006299', 'DE-MF-000006300', 'DE-MF-000012859', 
              'DE-MF-000009117', 'DE-MF-000006243', 'DE-MF-000008124', 'DE-MF-000006304', 'DE-MF-000005026', 'DE-MF-000012324', 'DE-MF-000007937',
              'DE-MF-000025211', 'DE-MF-000005906', 'DE-IM-000004952', 'DE-MF-000005410', 'DE-MF-000005414', 'DE-MF-000006997', 'DE-MF-000025211',
              'DE-MF-000019995', 'DE-MF-000009125', 'DE-MF-000004938', 'DE-MF-000019277', 'DE-MF-000006230', 'DE-MF-000006241', 'DE-MF-000006592',
              'DE-MF-000007202', 'DE-MF-000015891', 'DE-MF-000000022', 'DE-MF-000005874', 'DE-MF-000005448', 'DE-MF-000019692', 'DE-MF-000005029',
              'DE-MF-000005671', 'DE-MF-000010090', 'DE-MF-000022666', 'DE-MF-000005995', 
              'AT-MF-000000252', 'CH-MF-000009933', 'CH-MF-000015795', 'CH-MF-000019683', 'SE-MF-000000009', 'KR-MF-000020635', 'BE-MF-000001608',
              'IT-MF-000028795', 'IT-MF-000029407', 'JP-MF-000024849', 'NL-MF-000019230', 'GB-MF-000008770', 'CN-MF-000023257', 'CN-MF-000013088',
              'PK-MF-000035172', 'PK-MF-000024595'
             )
# Ausgabe der Namen und Anzahl der hinterlegten Materialien              
$hersteller|% {$mf=Get-EudamedEODetail -Srn $_;$mfd=$mf|Get-EudamedDevicesOfEO; [PSCustomObject]@{Srn=$_;Manufacturer=$mf.Name;Count=$mfd.Length}}|sort-Object Count -Descending|select Srn, Count, Manufacturer|ft
"" # Leerzeile

"" # Leerzeile
"Eudamed Versioninfos:"
Get-EudamedVersion

"Ende erreicht"
