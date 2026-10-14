[CmdletBinding()]
param(
    [string]$DownloadedPath = 'results',
    [ValidateRange(1,15)][int]$BatchSize = 8
)
$ErrorActionPreference = 'Stop'
$manifests = @(Get-ChildItem -Path $DownloadedPath -Filter manifest.json -Recurse -File)
if ($manifests.Count -eq 0) { throw 'Keine CND-Manifeste gefunden; Hersteller-Tests koennen nicht geplant werden.' }

$catalog = @($manifests | ForEach-Object {
    $data = Get-Content -LiteralPath $_.FullName -Raw | ConvertFrom-Json
    [pscustomobject]@{
        code = [string]$data.code
        hersteller = @($data.hersteller).Count
    }
} | Sort-Object code)

# Ein Matrix-Job darf niemals in Hunderte langsame Herstellerabfragen geraten.
# GitHub Actions erlaubt hoechstens 256 Matrix-Kombinationen.
$maxJobs = 240
$jobCount = 0
for ($size = $BatchSize; $size -le 15; $size++) {
    $jobCount = 0
    foreach ($row in $catalog) {
        $jobCount += [int][Math]::Ceiling($row.hersteller / $size)
    }
    if ($jobCount -le $maxJobs) { break }
}
if ($jobCount -gt $maxJobs) {
    throw "Zu viele Hersteller-Jobs ($jobCount). Fuer hoechstens $maxJobs Jobs braucht es weitere Aufteilung in mehrere Workflows."
}

$include = [System.Collections.Generic.List[object]]::new()
foreach ($row in $catalog) {
    for ($start = 0; $start -lt $row.hersteller; $start += $size) {
        $include.Add(@{ code = $row.code; start = $start; batchSize = $size })
    }
}
# Leeres Matrix-Include ist nicht fuer jeden Actions-Pfad zulaessig.
if ($include.Count -eq 0) { $include.Add(@{ code = 'NONE'; start = 0; batchSize = 1 }) }
$matrixJson = ConvertTo-Json -InputObject @{ include = @($include.ToArray()) } -Depth 5 -Compress
"matrix=$matrixJson" | Out-File -LiteralPath $env:GITHUB_OUTPUT -Encoding utf8 -Append
Write-Host "Hersteller=$([int](($catalog | Measure-Object -Property hersteller -Sum).Sum)), BatchSize=$size, Matrix-Jobs=$($include.Count)"
