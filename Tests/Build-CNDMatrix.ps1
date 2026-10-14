[CmdletBinding()]
param(
    [ValidateSet('dental','kfo','beide')][string]$Umfang = 'beide',
    [string]$CatalogPath = 'Tests/CND-Gruppen.json'
)
$ErrorActionPreference = 'Stop'
$catalog = @(Get-Content -LiteralPath $CatalogPath -Raw | ConvertFrom-Json)
$selected = @($catalog | Where-Object {
    ($Umfang -eq 'beide') -or
    ($Umfang -eq 'dental' -and $_.bereich -in @('Dental','Gemeinsam')) -or
    ($Umfang -eq 'kfo' -and $_.bereich -in @('KFO','Gemeinsam'))
})
$codes = @($selected | ForEach-Object { $_.code })
if ($codes.Count -ne @($codes | Select-Object -Unique).Count) { throw 'CND-Codes sind im Katalog mehrfach vorhanden.' }
if ($selected.Count -eq 0) { throw 'Keine CND-Kategorien gefunden.' }
foreach ($entry in $selected) {
    if ($entry.code -notmatch '^[A-Z][0-9]{4,}$') { throw "Ungueltiger Code: $($entry.code)" }
}
$matrixJson = ConvertTo-Json -InputObject @{ include = $selected } -Depth 7 -Compress
"matrix=$matrixJson" | Out-File -LiteralPath $env:GITHUB_OUTPUT -Encoding utf8 -Append
Write-Host "Umfang=$Umfang, CND-Jobs=$($selected.Count)"
