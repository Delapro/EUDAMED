# Requires Powershell 7

# Hinweis: Sobald ein Device als discarded gemeldet wird, funktioniert die Abfrage nach der PrimaryDI nicht mehr!!

# $url = 'https://ec.europa.eu/tools/eudamed/api/devices/udiDiData/c7418f9f-3f31-4329-b2c1-956377dbe23b?languageIso2Code=de' # siehe auch Erläuterung unten
$url = 'https://ec.europa.eu/tools/eudamed/api/devices/udiDiData/daa0ebcd-5773-4280-a1c8-0fb3160e9603?languageIso2Code=de'
"Los gehts mit $url"
$start = Get-Date
$r = Invoke-WebRequest -UseBasicParsing -Uri $Url -ErrorAction SilentlyContinue -SkipHttpErrorCheck -Verbose
$ende = Get-Date

"Dauer: $(($ende-$start).TotalSeconds)"
"Ergebnis: $($r.Status)"
If ($r.StatusCode -eq 200) {
  "Ausgabe:"
  $r.Content
}
If ($r.StatusCode -eq 500) {
  "Request timed out"
}

# $url = 'https://ec.europa.eu/tools/eudamed/api/devices/udiDiData?primaryDi=E4947660611' # Material E4947660611 gibts anscheinend nicht mehr in der Datenbank, deshalb wurde auf E4947662361 gewechselt
$url = 'https://ec.europa.eu/tools/eudamed/api/devices/udiDiData?primaryDi=E4947662361'
"Los gehts mit $url"
$start = Get-Date
$r = Invoke-WebRequest -UseBasicParsing -Uri $Url -TimeoutSec 200 -ErrorAction SilentlyContinue -SkipHttpErrorCheck -Verbose
$ende = Get-Date

"Dauer: $(($ende-$start).TotalSeconds)"
"Ergebnis: $($r.Status)"
If ($r.StatusCode -eq 200) {
  "Ausgabe:"
  $r.Content
}
If ($r.StatusCode -eq 500) {
  "Request timed out"
}

# so wird ein Device als Discarded gemeldet:
# 
#    "versionState" : {
#      "code" : "refdata.eudamed-entity-version-status.discarded"
#    },
#    "latestVersion" : true,
#    "versionNumber" : 1,
#    "newDevice" : null,
#    "discardedDate" : "2025-06-24",
#
# es kommt also auf den VersionState "refdata.eudamed-entity-version-status.discarded" und discardedDate an.

# $url = 'https://ec.europa.eu/tools/eudamed/api/devices/udiDiData/c7418f9f-3f31-4329-b2c1-956377dbe23b?languageIso2Code=de' # siehe auch Erläuterung unten
# $url = 'https://ec.europa.eu/tools/eudamed/api/devices/udiDiData/daa0ebcd-5773-4280-a1c8-0fb3160e9603?languageIso2Code=de'
$url = 'https://ec.europa.eu/tools/eudamed/api/devices/udiDiData/83026ea4-b935-44f6-b86e-011772c84990?languageIso2Code=de'
"Los gehts mit $url"
$start = Get-Date
$r = Invoke-WebRequest -UseBasicParsing -Uri $Url -ErrorAction SilentlyContinue -SkipHttpErrorCheck -Verbose
$ende = Get-Date

"Dauer: $(($ende-$start).TotalSeconds)"
"Ergebnis: $($r.Status)"
If ($r.StatusCode -eq 200) {
  "Ausgabe:"
  $r.Content
}
If ($r.StatusCode -eq 500) {
  "Request timed out"
}

# $url = 'https://ec.europa.eu/tools/eudamed/api/devices/udiDiData?primaryDi=E4947660611' # Material E4947660611 gibts anscheinend nicht mehr in der Datenbank, deshalb wurde auf E4947662361 gewechselt
$url = 'https://ec.europa.eu/tools/eudamed/api/devices/udiDiData?primaryDi=E4947662361'   # Material E4947660611 wird seit Juli 2025 offziell als Discarded geführt
$url = 'https://ec.europa.eu/tools/eudamed/api/devices/udiDiData?primaryDi=E4947681351'
"Los gehts mit $url"
$start = Get-Date
$r = Invoke-WebRequest -UseBasicParsing -Uri $Url -TimeoutSec 200 -ErrorAction SilentlyContinue -SkipHttpErrorCheck -Verbose
$ende = Get-Date

"Dauer: $(($ende-$start).TotalSeconds)"
"Ergebnis: $($r.Status)"
If ($r.StatusCode -eq 200) {
  "Ausgabe:"
  $r.Content
}
If ($r.StatusCode -eq 500) {
  "Request timed out"
}
