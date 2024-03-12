# sicherstellen, dass die Datumsausgaben im bekannten Format stattfinden
Set-Culture('de-DE')

$start = Get-Date
"Devices: $(Get-EudamedDevices -OnlyTotalElements)"
$ende = Get-Date
"Dauer: $(($ende-$start).TotalSeconds)"

" " # Leerzeile

$start = Get-Date
$devices = Get-EudamedDevices
$ende = Get-Date
"Devices: $($devices.Length)"
"Dauer: $(($ende-$start).TotalSeconds)"

