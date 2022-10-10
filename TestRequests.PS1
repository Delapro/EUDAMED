$url = 'https://ec.europa.eu/tools/eudamed/api/devices/udiDiData/c7418f9f-3f31-4329-b2c1-956377dbe23b?languageIso2Code=de'
"Los gehts mit $url"
$start = Get-Date
$r = Invoke-WebRequest -UseBasicParsing -Uri $Url -ErrorAction SilentlyContinue -Verbose
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

$url = 'https://ec.europa.eu/tools/eudamed/api/devices/udiDiData?primaryDi=E4947660611'
"Los gehts mit $url"
$start = Get-Date
$r = Invoke-WebRequest -UseBasicParsing -Uri $Url -TimeoutSec 200 -ErrorAction SilentlyContinue -Verbose
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
