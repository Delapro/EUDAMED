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

$hersteller=@('DE-MF-000007705', 'DE-IM-000006314', 'DE-MF-000007706', 'DE-MF-000023384', 'DE-MF-000006299', 'DE-MF-000006300', 'DE-MF-000012859', 
              'DE-MF-000009117', 'DE-MF-000006243', 'DE-MF-000008124', 'DE-MF-000006304', 'DE-MF-000005026', 'DE-MF-000012324', 'DE-MF-000007937',
              'DE-MF-000025211', 'DE-MF-000005906', 'DE-IM-000004952', 'DE-MF-000005410', 'DE-MF-000005414', 'DE-MF-000006997', 'DE-MF-000025211',
              'DE-MF-000019995', 'DE-MF-000009125', 'DE-MF-000004938', 'DE-MF-000019277', 'DE-MF-000006230', 'DE-MF-000006241', 'DE-MF-000006592',
              'AT-MF-000000252', 'CH-MF-000009933', 'CH-MF-000015795', 'CH-MF-000019683', 'SE-MF-000000009', 'KR-MF-000020635', 'BE-MF-000001608'
             )
# Ausgabe der Namen und Anzahl der hinterlegten Materialien              
$hersteller|% {$mf=Get-EudamedEODetail -Srn $_;$mfd=$mf|Get-EudamedDevicesOfEO; "$_ $($mf.Name): $($mfd.Length)"}
"" # Leerzeile

# Dental (Q) Devices ermitteln:
$emdn = Get-EudamedEmdn
$emdn[13].children[0].children

# Beispiel CNDs:
# Q010601 umfasst: Legierungen
# Q010699 umfasst: Dentine, Liner
# Q01020601 umfasst: Zähne
# Q01020199 umfasst: ?
# Q01010103 umfasst: Dental composite
# P01020101 umfasst: Implantate
#  ? P010201 Dental Implants and Accessories (BEGO)
#  ? Q010399 Surgical Dental Devices (BEGO)
#  ? Q010280 Devices for Prosthetic Dentistry (BEGO)

$totalDevices = Get-EudamedPagedData -Url 'https://ec.europa.eu/tools/eudamed/api/devices/udiDiData' -OnlyTotalElements
"Devices Gesamtanzahl: $totalDevices"
"" # Leerzeile

# Legierungen ermitteln
$alloy = Get-EudamedDevicesOfCND -CndCode Q010601
"Legierungen (Q010601): $($alloy.Length)"

# Zähne ermitteln
$teeth = Get-EudamedDevicesOfCND -CndCode Q01020601
"Zähne (Q01020601): $($teeth.Length)"

# Dentin usw. ermitteln
$dent = Get-EudamedDevicesOfCND -CndCode Q010699
"Dentin usw. (Q010699): $($dent.Length)"

# Komposite ermitteln
$composite = Get-EudamedDevicesOfCND -CndCode Q01010103
"Komposite (Q01010103): $($composite.Length)"

# Implantate ermitteln
$implants = Get-EudamedDevicesOfCND -CndCode P01020101
"Implantatteile (P01020101): $($implants.Length)"

# Gesamtzahl obiger Devices
"Gesamtzahl obiger Devices: $($alloy.Length+$teeth.Length+$dent.Length+$composite.Length+$implants.Length)"
"" # Leerzeile

# alle CNDs mit Dental ermitteln:
$emdn = Get-EudamedEmdn
$ms = Get-EudamedEmdnSearch -emdn $emdn -text dental
"CNDs mit dental im Namen: $($ms.Length)"
"" # Leerzeile

# Zertifikate ermitteln
$certs = Get-EudamedCertificates
"Zertifikate: $($certs.Length)"
# ein paar Zertifikate ausgeben
$certs |select uuid, actorsrn, actorname, notifiedbodysrn, certificatenumber, issuedate, expirydate -First 5

# ZertifikatDetails ausgeben
$begoZert=Get-EudamedCertificateDetail -Uuid 91d6b1ef-2646-4b6d-b85e-48271918754b
"BEGO-Zertifikat:"
$begoZert
$begoZertDok=$begoZert.documents  # TODO: Duerr hat mehrere Zertifikate hinterlegt
# PDF-Datei herunterladen
Get-EudamedCertificateDownload -Uuid $begoZertDok.uuid -SaveFile -Path $begoZertDok.originalFilename -Verbose

"" # Leerzeile
"Eudamed Versioninfos:"
Get-EudamedVersion

"Ende erreicht"
