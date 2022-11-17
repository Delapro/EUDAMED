# sicherstellen, dass die Datumsausgaben im bekannten Format stattfinden
Set-Culture('de-DE')

$ed=Get-EudamedEODetail -Srn DE-MF-000006243|Get-EudamedDevicesOfEO
Get-EudamedDeviceDetail -Uuid 4236a036-cd15-4a08-ab6a-bb3beb28df09
# jetzt nochmal explizit Abfragen über die primaryDI durchführen
# $ed| select -First 2 | Foreach-Object -Parallel {Get-EudamedDeviceDetail -PrimaryDI $_.primaryDi -Verbose}
$ed| select -First 2 | Foreach-Object {Get-EudamedDeviceDetail -PrimaryDI $_.primaryDi -Verbose}

