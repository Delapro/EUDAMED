$url = 'https://ec.europa.eu/tools/eudamed/api/devices/udiDiData/c7418f9f-3f31-4329-b2c1-956377dbe23b?languageIso2Code=de'
$start = Get-Date
$r = Invoke-WebRequest -UseBasicParsing -Url $Url
$ende = Get-Date

"Dauer: $(($ende-$start).TotalSeconds)"
"Ergebnis: $($r.Status)"
If ($r.Status -eq 200) {
  "Ausgabe:"
  $r.Content
}

$url = 'https://ec.europa.eu/tools/eudamed/api/devices/udiDiData?primaryDi=E4947660611'
$start = Get-Date
$r = Invoke-WebRequest -UseBasicParsing -Url $Url
$ende = Get-Date

"Dauer: $(($ende-$start).TotalSeconds)"
"Ergebnis: $($r.Status)"
If ($r.Status -eq 200) {
  "Ausgabe:"
  $r.Content
}
