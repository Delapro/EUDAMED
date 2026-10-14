# Testet jeden Hersteller einer Kategorie erneut ueber die EUDAMED-API.
# Die zuvor geladenen CND-Devices werden NICHT zur Herstellerzaehlung benutzt.
[CmdletBinding()]
param(
    [Parameter(Mandatory)][string]$ManifestPath,
    [Parameter(Mandatory)][ValidateRange(0,1000000)][int]$Start,
    [Parameter(Mandatory)][ValidateRange(1,20)][int]$BatchSize,
    [string]$OutputPath = 'out'
)

$ErrorActionPreference = 'Stop'
New-Item -Path $OutputPath -ItemType Directory -Force | Out-Null
$manifest = Get-Content -LiteralPath $ManifestPath -Raw | ConvertFrom-Json
$names = @($manifest.hersteller | Where-Object { -not [string]::IsNullOrWhiteSpace([string]$_) })
if ($Start -ge $names.Count) {
    throw "Ungueltiger Hersteller-Batch: Start=$Start; Anzahl=$($names.Count)"
}
$last = [Math]::Min($Start + $BatchSize, $names.Count)
$results = [System.Collections.Generic.List[object]]::new()
$failures = 0

"Hersteller von $($manifest.bezeichnung) ($($manifest.code)) – Batch ab ${Start}:"
''
for ($i = $Start; $i -lt $last; $i++) {
    $name = [string]$names[$i]
    $timer = [Diagnostics.Stopwatch]::StartNew()
    $status = 'OK'
    $count = $null
    $errorMessage = ''
    try {
        # Jede Abfrage erfolgt neu ueber die oeffentliche API (keine CND-Daten).
        $count = Get-EudamedEODevicesByManufacturerName -ManufacturerName $name -OnlyTotalElements -ErrorAction Stop
        if ($null -eq $count -or -not ("$count" -match '^\d+$')) {
            throw "Kein gueltiger numerischer Count fuer Hersteller '$name': $count"
        }
        if ([long]$count -eq 0) {
            throw "0 Devices fuer '$name', obwohl der Hersteller im CND $($manifest.code) vorkam."
        }
    }
    catch {
        $status = 'ERROR'
        $errorMessage = $_.Exception.Message
        $failures++
        Write-Warning "Hersteller '$name': $errorMessage"
    }
    finally { $timer.Stop() }

    $results.Add([pscustomobject]@{
        Bereich          = [string]$manifest.bereich
        CndCode          = [string]$manifest.code
        Bezeichnung      = [string]$manifest.bezeichnung
        ManufacturerName = $name
        Count            = $count
        DurationMs       = $timer.ElapsedMilliseconds
        Status           = $status
        Error            = $errorMessage
    })
}

# Urspruengliche tabellarische Darstellung beibehalten.
$results | Sort-Object @{ Expression = { if ($_.Status -eq 'OK') { [long]$_.Count } else { -1 } }; Descending = $true } |
    Select-Object Count, ManufacturerName |
    Format-Table -AutoSize |
    Out-String -Width 240 |
    Write-Output
"Hersteller in diesem Batch: $($results.Count)"
"Fehler in diesem Batch: $failures"
''

# Internes JSON dient ausschliesslich der spaeteren Zusammenfuehrung.
# Auch bei Fehlern sichern, damit die Tabelle vollstaendig bleibt.
ConvertTo-Json -InputObject @($results.ToArray()) -Depth 6 |
    Set-Content -LiteralPath (Join-Path $OutputPath 'hersteller-ergebnisse.json') -Encoding utf8
if ($failures -gt 0) {
    throw "$failures von $($results.Count) Hersteller-API-Tests fehlgeschlagen (CND $($manifest.code), Start $Start)."
}
