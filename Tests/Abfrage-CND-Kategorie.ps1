# Ein CND/EMDN-Code pro GitHub-Job. Der Download erfolgt frisch via API.
# Fuer die nachgelagerten unabhängigen Hersteller-HTTP-Abfragen wird nur
# eine JSON-Liste der Herstellernamen zwischen den Jobs uebertragen.
[CmdletBinding()]
param(
    [Parameter(Mandatory)][ValidatePattern('^[A-Z][0-9]{4,}$')][string]$CndCode,
    [Parameter(Mandatory)][ValidateSet('Dental','KFO','Gemeinsam')][string]$Bereich,
    [Parameter(Mandatory)][string]$Bezeichnung,
    [Parameter(Mandatory)][string]$Typ,
    [string]$OutputPath = 'out'
)

$ErrorActionPreference = 'Stop'
New-Item -Path $OutputPath -ItemType Directory -Force | Out-Null
$clock = [Diagnostics.Stopwatch]::StartNew()

# Vollstaendiger neuer API-Download. Kein Cache und keine Device-Daten
# aus anderen Tests oder Artifacts.
$devices = @(Get-EudamedDevicesOfCND -CndCode $CndCode)
$clock.Stop()

$names = @(
    $devices | ForEach-Object { [string]$_.manufacturerName } |
        Where-Object { -not [string]::IsNullOrWhiteSpace($_) } |
        Sort-Object -Unique
)

# JSON nur fuer die Uebergabe zwischen GitHub-Jobs; keine CSV-/JSON-Berichtsausgabe.
$manifest = [ordered]@{
    code         = $CndCode
    bereich      = $Bereich
    typ          = $Typ
    bezeichnung  = $Bezeichnung
    anzahl       = $devices.Count
    hersteller   = $names
    durationMs   = $clock.ElapsedMilliseconds
    collectedUtc = [DateTime]::UtcNow.ToString('o')
}
$manifest | ConvertTo-Json -Depth 6 |
    Set-Content -LiteralPath (Join-Path $OutputPath 'manifest.json') -Encoding utf8

"$Bezeichnung ($CndCode): $($devices.Count)"
"Bereich: $Bereich; Typ: $Typ"
"Anzahl Hersteller: $($names.Count)"
"Dauer: $($clock.ElapsedMilliseconds) ms"
''
