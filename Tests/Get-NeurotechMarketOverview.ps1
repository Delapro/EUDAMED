#requires -Version 7.0
<#
.SYNOPSIS
    EUDAMED-Neurotechnik: Hersteller, Device-Anzahlen und 10 juengste Datensaetze.
.DESCRIPTION
    Verwendet ausschliesslich bestehende Funktionen aus ../PSEudamed.PS1.
    Ausgabe ausschliesslich in GitHub-Actions-Logs bzw. auf der Konsole.
    Keine Dateien, keine Historie und keine externen PowerShell-Module.

    Achtung: "on-the-market" ist ein EUDAMED-Status. Der aus der ULID
    abgeleitete Zeitpunkt datiert die Datensatzkennung, nicht die
    tatsaechliche Markteinfuehrung des Produkts.
#>
[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'

# Dieses Skript muss im Repository unter Tests/ liegen.
$repoRoot = Split-Path -Parent $PSScriptRoot
$library = Join-Path $repoRoot 'PSEudamed.PS1'
if (-not (Test-Path -LiteralPath $library -PathType Leaf)) {
    throw "PSEudamed.PS1 nicht gefunden: $library (Skript im Repository unter Tests/ ausfuehren)."
}
. $library

# Kein doppelter API-Code: Die vorhandene Funktion verwendet den Filter
# deviceStatusCode=refdata.device-model-status.on-the-market und die
# bestehende, gegen inkonsistente Pagination abgesicherte Seitenabfrage.
$areas = [ordered]@{
    'J0201'     = 'Implantierbare zerebrale Neurostimulatoren'
    'N010102'   = 'EEG-Elektroden und EEG-Headsets'
    'Z12100801' = 'EEG-Telemetrie'
    'Z121010'   = 'EEG-Systeme und EEG-Holter'
    'Z12101102' = 'Positionierung von Hirnstimulationselektroden'
    'Z12101104' = 'Zerebrale Kartierung'
    'Z12101105' = 'Magnetische Stimulatoren'
    'Z12101106' = 'Neurologische Stimulatoren'
    'Z12101201' = 'Magnetoenzephalografie'
    'Z12109002' = 'Elektrokrampftherapie-Geraete'
    'Z12109006' = 'Ueberwachung von Hirngewebe'
}

# ULIDs beginnen mit zehn Base32-Zeichen, die einen Millisekunden-Zeitstempel
# kodieren. Das ist ein Indiz fuer den Zeitpunkt der Erfassung/Version, KEIN
# bezeugtes Datum der CE-Zertifizierung oder des Inverkehrbringens.
function Get-UlidDateUtc {
    param([string] $Ulid)
    $alphabet = '0123456789ABCDEFGHJKMNPQRSTVWXYZ'
    if ($Ulid -notmatch '^[0-9A-HJKMNP-TV-Z]{26}$') { return 'unbekannt' }

    [long] $milliseconds = 0
    foreach ($letter in $Ulid.Substring(0, 10).ToCharArray()) {
        $digit = $alphabet.IndexOf([string] $letter)
        if ($digit -lt 0) { return 'unbekannt' }
        $milliseconds = ($milliseconds * 32) + $digit
    }
    try {
        return [DateTimeOffset]::FromUnixTimeMilliseconds($milliseconds).UtcDateTime.ToString('yyyy-MM-dd HH:mm "UTC"')
    }
    catch { return 'unbekannt' }
}

Write-Host ('=' * 88)
Write-Host 'EUDAMED | NEUROTECHNIK-MARKTUEBERSICHT'
Write-Host ("Abfrage am {0:yyyy-MM-dd HH:mm:ss} UTC" -f [DateTime]::UtcNow)
Write-Host 'Datenquelle: EUDAMED UI-API via PSEudamed.PS1 / Get-EudamedDevicesOfCND'
Write-Host 'Filter: "on-the-market"; je EMDN-Code einschliesslich Untergruppen'
Write-Host ('=' * 88)

# Deduplizierung der UDI-DIs ueber die abgefragten EMDN-Bereiche hinweg.
$devicesById = [System.Collections.Generic.Dictionary[string,object]]::new(
    [System.StringComparer]::OrdinalIgnoreCase
)

foreach ($code in $areas.Keys) {
    $label = $areas[$code]
    Write-Host ("`n>> Abfrage {0}: {1}" -f $code, $label)

    # Repo-Funktion, nicht neu implementiert! Fehler muessen den Lauf stoppen,
    # damit API-Probleme nicht als falsche Marktstatistik erscheinen.
    $items = @(Get-EudamedDevicesOfCND -CndCode $code -ErrorAction Stop)
    $valid = 0
    foreach ($device in $items) {
        if ($null -eq $device) { continue }
        if ($device.latestVersion -eq $false) { continue }
        if ([string]$device.versionState.code -match '\.discarded$') { continue }
        $status = [string]$device.deviceStatusType.code
        if ($status -and $status -ne 'refdata.device-model-status.on-the-market') { continue }

        $srn = ([string]$device.manufacturerSrn).Trim()
        $manufacturer = ([string]$device.manufacturerName).Trim()
        if (-not $manufacturer) { $manufacturer = '(Herstellername nicht angegeben)' }
        $di = ([string]$device.primaryDi).Trim()
        $uuid = ([string]$device.uuid).Trim()
        $ulid = ([string]$device.ulid).Trim().ToUpperInvariant()

        # UDI-DI ist die Kennung einer Geraetevariante. Wenn keine UDI-DI
        # vorhanden ist, wird auf die Datensatz-UUID zurueckgegriffen.
        if ($di) {
            $deviceKey = 'DI:' + $srn + ':' + $di
        }
        elseif ($uuid) {
            $deviceKey = 'UUID:' + $uuid
        }
        else {
            Write-Warning "Ein Datensatz ohne PrimaryDI und UUID in $code wurde uebersprungen."
            continue
        }

        $manufacturerKey = if ($srn) { 'SRN:' + $srn } else { 'NAME:' + $manufacturer }
        $displayName = ([string]$device.tradeName).Trim()
        if (-not $displayName) { $displayName = ([string]$device.deviceName).Trim() }
        if (-not $displayName) { $displayName = ([string]$device.deviceModel).Trim() }
        if (-not $displayName) { $displayName = '(Produktname nicht angegeben)' }

        if (-not $devicesById.ContainsKey($deviceKey)) {
            $devicesById.Add($deviceKey, [pscustomobject]@{
                Key             = $deviceKey
                PrimaryDi       = $di
                Uuid            = $uuid
                Ulid            = $ulid
                Name            = $displayName
                Manufacturer    = $manufacturer
                ManufacturerSrn = $srn
                ManufacturerKey = $manufacturerKey
                BasicUdi        = ([string]$device.basicUdi).Trim()
                Areas           = [System.Collections.Generic.List[string]]::new()
            })
        }
        $record = $devicesById[$deviceKey]
        $areaText = "$code - $label"
        if (-not $record.Areas.Contains($areaText)) { [void]$record.Areas.Add($areaText) }
        # Wenn ein Duplikat mehr Angaben enthaelt, werden diese uebernommen.
        if (-not $record.Ulid -and $ulid) { $record.Ulid = $ulid }
        if (-not $record.ManufacturerSrn -and $srn) {
            $record.ManufacturerSrn = $srn
            $record.ManufacturerKey = 'SRN:' + $srn
        }
        $valid++
    }
    Write-Host ("   Treffer: {0}; nach Status-/Versionspruefung: {1}; eindeutige UDI-DIs gesamt: {2}" -f
        $items.Count, $valid, $devicesById.Count)
}

$allDevices = @($devicesById.Values)
if ($allDevices.Count -eq 0) {
    throw 'Kein passender Device-Datensatz gefunden. EMDN-Codes und API-Status kontrollieren.'
}

$manufacturers = @($allDevices | Group-Object -Property ManufacturerKey |
    Sort-Object -Property @{Expression = 'Count'; Descending = $true}, @{Expression = 'Name'; Descending = $false})

Write-Host ("`n{0}" -f ('=' * 88))
Write-Host ("HERSTELLER ({0}) | EINDEUTIGE UDI-DIs ({1})" -f $manufacturers.Count, $allDevices.Count)
Write-Host ('=' * 88)

$number = 0
foreach ($group in $manufacturers) {
    $number++
    $first = $group.Group[0]
    $areaSet = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::OrdinalIgnoreCase)
    foreach ($item in $group.Group) {
        foreach ($area in $item.Areas) { [void]$areaSet.Add($area) }
    }
    $areaNames = (@($areaSet | Sort-Object) -join '; ')
    $srnText = if ($first.ManufacturerSrn) { $first.ManufacturerSrn } else { 'keine SRN' }
    Write-Host ("{0,3}. {1} | {2} Devices | {3}" -f $number, $first.Manufacturer, $group.Count, $srnText)
    Write-Host ("     Bereiche: {0}" -f $areaNames)
}

# Sortierung ausschliesslich nach ULID (nicht nach geschaetztem Markteintritt).
# Ohne ULID ist die zeitliche Reihenfolge aus der API-Antwort nicht sicher
# bestimmbar; solche Datensaetze bleiben in den Herstellerzahlen enthalten.
$withUlid = @($allDevices | Where-Object { $_.Ulid -match '^[0-9A-HJKMNP-TV-Z]{26}$' })
$latest = @($withUlid | Sort-Object -Property Ulid -Descending | Select-Object -First 10)

Write-Host ("`n{0}" -f ('=' * 88))
Write-Host '10 JUENGSTE EUDAMED-DATENSATZKENNUNGEN (Status: on-the-market)'
Write-Host 'ULID-Zeit = Erfassungs-/Versionierungsindikator, NICHT Datum der Markteinfuehrung.'
Write-Host ('=' * 88)
if ($allDevices.Count -gt $withUlid.Count) {
    Write-Warning ("{0} Devices ohne gueltige ULID wurden nicht in die zeitliche Top-10-Liste aufgenommen." -f
        ($allDevices.Count - $withUlid.Count))
}
if ($latest.Count -eq 0) { Write-Host '(Keine sortierbaren Datensaetze.)' }

$rank = 0
foreach ($item in $latest) {
    $rank++
    Write-Host ("{0,2}. {1} | {2}" -f $rank, $item.Name, $item.Manufacturer)
    Write-Host ("    ULID-Zeit: {0} | PrimaryDI: {1} | BasicUDI: {2}" -f
        (Get-UlidDateUtc -Ulid $item.Ulid), $item.PrimaryDi, $item.BasicUdi)
    Write-Host ("    EMDN-Bereiche: {0}" -f ($item.Areas -join '; '))
    if ($item.Uuid) {
        Write-Host ("    EUDAMED: https://ec.europa.eu/tools/eudamed/#/screen/search-device?uuid={0}" -f $item.Uuid)
    }
}
Write-Host ('=' * 88)
Write-Host 'Hinweis: Registrierte UDI-DIs != Produktfamilien, Marktanteile oder neu eingefuehrte Produkte.'
