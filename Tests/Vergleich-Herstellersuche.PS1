[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [string]$ManufacturerName,

    [ValidateSet('Count', 'Full')]
    [string]$Mode = 'Count',

    [Parameter(Mandatory)]
    [string]$CaseId,

    [Parameter(Mandatory)]
    [string]$OutputDir
)

$ErrorActionPreference = 'Stop'
$null = New-Item -ItemType Directory -Path $OutputDir -Force
. (Join-Path $PSScriptRoot '..' 'PSEudamed.PS1')

$rows = [System.Collections.Generic.List[object]]::new()
$datasets = @{}
$methods = @(
    @{ Method='SRN'; Function='Get-EudamedEODevicesByManufacturerName' },
    @{ Method='Regression'; Function='Get-EudamedEODevicesByManufacturerNameRegression' }
)

foreach ($method in $methods) {
    $label = $method.Method
    $functionName = $method.Function
    $stopwatch = [Diagnostics.Stopwatch]::StartNew()
    $status = 'OK'
    $message = ''
    $count = $null
    $matchingNames = $null

    Write-Host "=== $CaseId / $label / $ManufacturerName / $Mode ==="
    try {
        if ($Mode -eq 'Count') {
            # Beide Methoden fuehren LIVE-Abfragen aus. Es wird jeweils
            # die Anzahl direkt vom Server ermittelt, nichts gecacht.
            $count = [long](& $functionName -ManufacturerName $ManufacturerName -OnlyTotalElements -Verbose)
        }
        else {
            # Beide Methoden laden ihre komplette Ergebnismenge separat.
            $devices = @(& $functionName -ManufacturerName $ManufacturerName -Verbose)
            $count = [long]$devices.Count
            $datasets[$label] = $devices

            $matchingNames = @($devices | Where-Object {
                $name = [string]$_.manufacturerName
                $name.IndexOf($ManufacturerName, [StringComparison]::OrdinalIgnoreCase) -ge 0
            }).Count

            $csvPath = Join-Path $OutputDir "$CaseId-$label-devices.csv"
            $devices | Select-Object primaryDi, uuid, manufacturerSrn, manufacturerName, tradeName |
                Export-Csv -Path $csvPath -NoTypeInformation -Encoding utf8

            @($devices | Select-Object -First 20) |
                ConvertTo-Json -Depth 8 |
                Set-Content -Path (Join-Path $OutputDir "$CaseId-$label-sample.json") -Encoding utf8
        }
        Write-Host "OK $label count=$count durationMs=$($stopwatch.ElapsedMilliseconds)"
    }
    catch {
        $status = 'ERROR'
        $message = $_.Exception.Message
        Write-Warning "FEHLER $label : $message"
    }
    finally {
        $stopwatch.Stop()
        $rows.Add([pscustomobject]@{
            CaseId              = $CaseId
            ManufacturerName    = $ManufacturerName
            Mode                = $Mode
            Method              = $label
            Status              = $status
            Count               = $count
            MatchingNameDevices = $matchingNames
            DurationMs          = $stopwatch.ElapsedMilliseconds
            Error               = $message
        })
    }
}

$overlap = $null
if ($Mode -eq 'Full' -and $datasets.ContainsKey('SRN') -and $datasets.ContainsKey('Regression')) {
    $srnKeys = [System.Collections.Generic.HashSet[string]]::new([StringComparer]::Ordinal)
    $legacyKeys = [System.Collections.Generic.HashSet[string]]::new([StringComparer]::Ordinal)

    foreach ($device in $datasets.SRN) {
        if (-not [string]::IsNullOrWhiteSpace([string]$device.primaryDi)) {
            [void]$srnKeys.Add([string]$device.primaryDi)
        }
    }
    foreach ($device in $datasets.Regression) {
        if (-not [string]::IsNullOrWhiteSpace([string]$device.primaryDi)) {
            [void]$legacyKeys.Add([string]$device.primaryDi)
        }
    }

    $shared = 0
    foreach ($key in $srnKeys) {
        if ($legacyKeys.Contains($key)) { $shared++ }
    }
    $overlap = [pscustomobject]@{
        SrnUniquePrimaryDi = $srnKeys.Count
        RegressionUniquePrimaryDi = $legacyKeys.Count
        SharedPrimaryDi = $shared
        OnlySrn = $srnKeys.Count - $shared
        OnlyRegression = $legacyKeys.Count - $shared
    }
}

$report = [pscustomobject]@{
    CaseId = $CaseId
    ManufacturerName = $ManufacturerName
    Mode = $Mode
    TimestampUTC = [DateTime]::UtcNow.ToString('o')
    Results = @($rows.ToArray())
    Overlap = $overlap
}
$report | ConvertTo-Json -Depth 8 |
    Set-Content -Path (Join-Path $OutputDir "$CaseId-report.json") -Encoding utf8
$rows | Export-Csv -Path (Join-Path $OutputDir "$CaseId-report.csv") -NoTypeInformation -Encoding utf8

if ($env:GITHUB_STEP_SUMMARY) {
    $summary = @(
        "### Herstellervergleich: $ManufacturerName",
        '',
        "Modus: **$Mode**. Beide Methoden senden ihre eigenen HTTP-Abfragen.",
        '',
        '| Methode | Status | Treffer | Zeit (ms) |',
        '|---|---|---:|---:|'
    )
    foreach ($row in $rows) {
        $summary += "| $($row.Method) | $($row.Status) | $($row.Count) | $($row.DurationMs) |"
    }
    if ($null -ne $overlap) {
        $summary += ''
        $summary += "Gemeinsame Primary-DIs: $($overlap.SharedPrimaryDi); nur SRN: $($overlap.OnlySrn); nur Regression: $($overlap.OnlyRegression)."
    }
    $summary | Add-Content -Path $env:GITHUB_STEP_SUMMARY -Encoding utf8
}

# Unterschiedliche Trefferzahlen sind KEIN automatischer Fehler:
# 'name' ist eine breitere Textsuche, 'srn' eine Herstellersuche.
# HTTP-Fehler dagegen werden fuer den Actions-Status sichtbar gemacht.
if (@($rows | Where-Object Status -eq 'ERROR').Count -gt 0) {
    throw 'Mindestens eine der beiden API-Varianten ist fehlgeschlagen; Report wurde gespeichert.'
}
