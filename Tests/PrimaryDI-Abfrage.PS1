# sicherstellen, dass die Datumsausgaben im bekannten Format stattfinden
Set-Culture('de-DE')

$ed=Get-EudamedEODetail -Srn DE-MF-000006243|Get-EudamedDevicesOfEO
# jetzt nochmal explizit Abfragen über die primaryDI durchführen
$ed| select -First 2 | % -Parallel {Get-EudamedDeviceDetail -PrimaryDI $_.primaryDi -Verbose}

