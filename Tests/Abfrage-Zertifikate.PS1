# sicherstellen, dass die Datumsausgaben im bekannten Format stattfinden
Set-Culture('de-DE')

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

# Notified Bodies ausgeben
$nb = Get-EudamedNotifiedBodies
# Infos ausgeben
$nb|select uuid, eudamedidentifier, name
"Notified Bodies: $($nb.Length)"
"" # Leerzeile

# Alle Zertifikate von einem Notified Body ermitteln, hier TÜV Rheinland
$certsTR = Get-EudamedCertificates -NotifiedBodySrn 0197
"Zertifikate von TÜV Rheinland: $($certsTR.Length)"

"" # Leerzeile
"Eudamed Versioninfos:"
Get-EudamedVersion

"Ende erreicht"
