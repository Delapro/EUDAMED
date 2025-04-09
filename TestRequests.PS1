# Requires Powershell 7

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
