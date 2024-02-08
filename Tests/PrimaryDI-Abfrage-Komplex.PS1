# sicherstellen, dass die Datumsausgaben im bekannten Format stattfinden
Set-Culture('de-DE')

# hier eine Liste aller bei HIBC registrierten Dentalhersteller: https://www.hibcc.org/wp-content/uploads/Current-HIBC-Dental-Labelers.pdf
# Link für EO-Suche: https://ec.europa.eu/tools/eudamed/#/screen/search-eo
$hersteller=@('DE-MF-000007705', 'DE-IM-000006314', 'DE-MF-000007706', 'DE-MF-000023384', 'DE-MF-000006299', 'DE-MF-000006300', 'DE-MF-000012859', 
              'DE-MF-000009117', 'DE-MF-000006243', 'DE-MF-000008124', 'DE-MF-000006304', 'DE-MF-000005026', 'DE-MF-000012324', 'DE-MF-000007937',
              'DE-MF-000025211', 'DE-MF-000005906', 'DE-IM-000004952', 'DE-MF-000005410', 'DE-MF-000005414', 'DE-MF-000006997', 'DE-MF-000025211',
              'DE-MF-000019995', 'DE-MF-000009125', 'DE-MF-000004938', 'DE-MF-000019277', 'DE-MF-000006230', 'DE-MF-000006241', 'DE-MF-000006592',
              'DE-MF-000007202', 'DE-MF-000015891', 'DE-MF-000000022', 'DE-MF-000005874', 'DE-MF-000005448', 'DE-MF-000019692', 'DE-MF-000005029',
              'DE-MF-000005671', 'DE-MF-000010090', 'DE-MF-000022666', 'DE-MF-000005995', 'DE-MF-000038372', 'DE-MF-000009412', 'DE-MF-000005557',
              'DE-MF-000008303', 'DE-MF-000005566', 'DE-MF-000005811'
             )

# Ausgabe der Namen und Anzahl der hinterlegten Materialien              
$hersteller | ForEach-Object -ThrottleLimit 10 -Parallel {Get-EudamedDevicesOfEO -Srn $_} | Get-EudamedDeviceDetail  -Verbose 

"" # Leerzeile
