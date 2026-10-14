# GitHub Artifacts aller parallel ausgefuehrten Tests zusammenfuehren.
# Sichtbare Ausgaben: Format-Table/Text/Logs/Markdown; JSON nur als interne Uebergabe.
[CmdletBinding()]
param(
    [string]$ResultsPath = 'results',
    [string]$OutputPath = 'combined'
)
$ErrorActionPreference = 'Stop'
New-Item -Path $OutputPath -ItemType Directory -Force | Out-Null

$manifests = @(
    Get-ChildItem -Path $ResultsPath -Filter 'manifest.json' -File -Recurse |
        ForEach-Object { Get-Content -LiteralPath $_.FullName -Raw | ConvertFrom-Json } |
        Sort-Object bereich, code
)
$manufacturer = @(
    Get-ChildItem -Path $ResultsPath -Filter 'hersteller-ergebnisse.json' -File -Recurse |
        ForEach-Object {
            $data = Get-Content -LiteralPath $_.FullName -Raw | ConvertFrom-Json
            foreach ($row in @($data)) { $row }
        } |
        Sort-Object Bereich, CndCode, ManufacturerName
)
$failed = @($manufacturer | Where-Object { $_.Status -ne 'OK' })

$overview = [System.Collections.Generic.List[string]]::new()
$overview.Add('EUDAMED – CND- und Hersteller-Tests')
$overview.Add('')
$overview.Add('CND-Kategorien:')
if ($manifests.Count -gt 0) {
    $categoryRows = @($manifests | ForEach-Object {
        [pscustomobject]@{
            Bereich     = $_.bereich
            CndCode     = $_.code
            Bezeichnung = $_.bezeichnung
            Devices     = $_.anzahl
            Hersteller  = @($_.hersteller | Where-Object { -not [string]::IsNullOrWhiteSpace([string]$_) }).Count
            DurationMs  = $_.durationMs
        }
    })
    $overview.Add(($categoryRows | Format-Table -AutoSize | Out-String -Width 240).TrimEnd())
} else {
    $overview.Add('Keine vollstaendigen CND-Manifeste vorhanden.')
}
$overview.Add('')

# Pro CND-Kategorie eine vollstaendige Herstellertabelle – wie im Ursprungsskript,
# obwohl die HTTP-Aufrufe zuvor auf viele verschiedene Jobs verteilt wurden.
foreach ($cnd in $manifests) {
    $code = [string]$cnd.code
    $overview.Add("Hersteller von $($cnd.bezeichnung) ($code):")
    $rows = @($manufacturer | Where-Object { $_.CndCode -eq $code })
    if ($rows.Count -gt 0) {
        $sorted = @($rows | Sort-Object @{ Expression = { if ($_.Status -eq 'OK') { [long]$_.Count } else { -1 } }; Descending = $true }, ManufacturerName)
        $table = $sorted |
            Select-Object Count, ManufacturerName |
            Format-Table -AutoSize |
            Out-String -Width 240
        $overview.Add($table.TrimEnd())
    } else {
        $overview.Add('(Keine Herstellerpruefergebnisse vorhanden.)')
    }
    $overview.Add("Anzahl: $($rows.Count) von $(@($cnd.hersteller | Where-Object { -not [string]::IsNullOrWhiteSpace([string]$_) }).Count) erwarteten Herstellern")
    $overview.Add('')
}

$overview.Add("CND-Kategorien mit Ergebnis: $($manifests.Count)")
$overview.Add("Hersteller-Live-Tests: $($manufacturer.Count)")
$overview.Add("Fehlerhafte Hersteller-Live-Tests: $($failed.Count)")
$overview.Add('Hinweis: Geraetezahlen aus mehreren CND-Gruppen koennen sich ueberschneiden.')
$overview | Set-Content -LiteralPath (Join-Path $OutputPath 'Tabellen-Gesamt.log') -Encoding utf8

# Gesamte Konsolenausgabe einschliesslich aller Standardtests und aller Fehlerlogs.
$logPath = Join-Path $OutputPath 'Gesamt.log'
$overview | Set-Content -LiteralPath $logPath -Encoding utf8
foreach ($file in @(Get-ChildItem -Path $ResultsPath -Filter '*.log' -File -Recurse | Sort-Object FullName)) {
    Add-Content -LiteralPath $logPath -Value "`n=============== $($file.FullName) ===============" -Encoding utf8
    Get-Content -LiteralPath $file.FullName | Add-Content -LiteralPath $logPath -Encoding utf8
}

$report = @(
    '# EUDAMED – CND- und Herstellertests'
    ''
    "- CND-Kategorien mit Ergebnis: **$($manifests.Count)**"
    "- Hersteller-Live-Tests: **$($manufacturer.Count)**"
    "- Fehlerhafte Hersteller-Live-Tests: **$($failed.Count)**"
    ''
    '| Bereich | CND | Geraete | Hersteller |'
    '|---|---|---:|---:|'
)
foreach ($cnd in $manifests) {
    $expected = @($cnd.hersteller | Where-Object { -not [string]::IsNullOrWhiteSpace([string]$_) }).Count
    $report += "| $($cnd.bereich) | $($cnd.code) | $($cnd.anzahl) | $expected |"
}
$report += @('', 'Die Original-Tabellen stehen in `Tabellen-Gesamt.log`; die vollstaendigen Job-Logs in `Gesamt.log`.')
if ($failed.Count -gt 0) {
    $report += @('', '## Hersteller-API-Fehler')
    foreach ($row in $failed | Select-Object -First 30) {
        $report += "- $($row.CndCode): $($row.ManufacturerName): $($row.Error)"
    }
}
$report | Set-Content -LiteralPath (Join-Path $OutputPath 'Bericht.md') -Encoding utf8
if ($env:GITHUB_STEP_SUMMARY) {
    $report | Out-File -FilePath $env:GITHUB_STEP_SUMMARY -Encoding utf8 -Append
}
Write-Host "Kategorien=$($manifests.Count); Hersteller-Tests=$($manufacturer.Count); API-Fehler=$($failed.Count)"
if ($failed.Count -gt 0) {
    throw "$($failed.Count) Hersteller-Live-Tests fehlgeschlagen."
}
