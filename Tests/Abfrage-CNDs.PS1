# sicherstellen, dass die Datumsausgaben im bekannten Format stattfinden
Set-Culture('de-DE')

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
# Q010205 umfasst: vorgeformte Harze und dental Kronen

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

# Harze ermitteln
$resin = Get-EudamedDevicesOfCND -CndCode Q010205
"Harze (Q010205): $($resin.Length)"

# Gesamtzahl obiger Devices
"Gesamtzahl obiger Devices: $($alloy.Length+$teeth.Length+$dent.Length+$composite.Length+$implants.Length+$resin.Length)"
"" # Leerzeile

$header=@('leer',@{N='Count';E={Get-EudamedEODevicesByManufacturerName -ManufacturerName $_ -OnlyTotalElements}}, @{N='ManufacturerName';E={$_}})

"Hersteller von Legierungen:"
($alloy).manufacturerName | select -unique | select $header | sort-Object Count -Descending | ft
"Anzahl: $((($alloy).manufacturerName | select -unique).Length)"
"" # Leerzeile
"Hersteller von Zähnen:"
($teeth).manufacturerName | select -unique | select $header | sort-Object Count -Descending | ft
"Anzahl: $((($teeth).manufacturerName | select -unique).Length)"
"" # Leerzeile
"Hersteller von Dentin usw.:"
($dent).manufacturerName | select -unique | select $header | sort-Object Count -Descending | ft
"Anzahl: $((($dent).manufacturerName | select -unique).Length)"
"" # Leerzeile
"Hersteller von Komposite:"
($composite).manufacturerName | select -unique | select $header | sort-Object Count -Descending | ft
"Anzahl: $((($composite).manufacturerName | select -unique).Length)"
"" # Leerzeile
"Hersteller von Implantaten:"
($implants).manufacturerName | select -unique | select $header | sort-Object Count -Descending | ft
"Anzahl: $((($implants).manufacturerName | select -unique).Length)"
"" # Leerzeile
"Hersteller von Harzen:"
($resin).manufacturerName | select -unique | select $header | sort-Object Count -Descending | ft
"Anzahl: $((($resin).manufacturerName | select -unique).Length)"
"" # Leerzeile

# alle CNDs mit Dental ermitteln:
$emdn = Get-EudamedEmdn
$ms = Get-EudamedEmdnSearch -emdn $emdn -text dental
"CNDs mit dental im Namen: $($ms.Length)"
"" # Leerzeile

"" # Leerzeile
"Eudamed Versioninfos:"
Get-EudamedVersion

"Ende erreicht"
