# sicherstellen, dass die Datumsausgaben im bekannten Format stattfinden
Set-Culture('de-DE')

# https://ec.europa.eu/tools/eudamed/#/screen/search-device

$start = Get-Date
"Devices: $(Get-EudamedDevices -OnlyTotalElements)"
$ende = Get-Date
"Dauer: $(($ende-$start).TotalSeconds)"

" " # Leerzeile

$start = Get-Date
"Devices mit A Versuch mit RegEx: $(Get-EudamedDevices -OnlyTotalElements -Name '^A')"
$ende = Get-Date
"Dauer: $(($ende-$start).TotalSeconds)"

" " # Leerzeile

$start = Get-Date
"Devices mit B Versuch mit RegEx: $(Get-EudamedDevices -OnlyTotalElements -Name '^B')"
$ende = Get-Date
"Dauer: $(($ende-$start).TotalSeconds)"

" " # Leerzeile

$start = Get-Date
"Devices mit A: $(Get-EudamedDevices -OnlyTotalElements -Name 'A')"
$ende = Get-Date
"Dauer: $(($ende-$start).TotalSeconds)"

" " # Leerzeile

$start = Get-Date
"Devices mit B: $(Get-EudamedDevices -OnlyTotalElements -Name 'B')"
$ende = Get-Date
"Dauer: $(($ende-$start).TotalSeconds)"

" " # Leerzeile

$start = Get-Date
"Devices mit L: $(Get-EudamedDevices -OnlyTotalElements -Name 'L')" # LISTER BANDAGE SCISSORS 15cm, PLASTIC HANDLE [EN]
$ende = Get-Date
"Dauer: $(($ende-$start).TotalSeconds)"

" " # Leerzeile

<# # dauert ca. 5 Stunden:
$start = Get-Date
$devices = Get-EudamedDevices
$ende = Get-Date
"Devices: $($devices.Length)"
"Dauer: $(($ende-$start).TotalSeconds)"
#>
