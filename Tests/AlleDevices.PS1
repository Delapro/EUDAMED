# sicherstellen, dass die Datumsausgaben im bekannten Format stattfinden
Set-Culture('de-DE')

"Devices: $(Get-EudamedDevices -OnlyTotalElements)"
