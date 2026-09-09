# Regenerates TyMoore_Resume.pdf from index.html using headless Chrome.
# The PDF and the web page share one source file, so they cannot drift apart.

$ErrorActionPreference = 'Stop'

$root = $PSScriptRoot
$html = Join-Path $root 'index.html'
$pdf  = Join-Path $root 'TyMoore_Resume.pdf'

$chrome = @(
    "$env:ProgramFiles\Google\Chrome\Application\chrome.exe",
    "${env:ProgramFiles(x86)}\Google\Chrome\Application\chrome.exe",
    "$env:LOCALAPPDATA\Google\Chrome\Application\chrome.exe",
    "${env:ProgramFiles(x86)}\Microsoft\Edge\Application\msedge.exe"
) | Where-Object { Test-Path $_ } | Select-Object -First 1

if (-not $chrome) { throw 'Chrome or Edge not found. Install one, or edit the paths above.' }
if (-not (Test-Path $html)) { throw "Missing source file: $html" }

Write-Host "Rendering with: $chrome"

& $chrome --headless=new --disable-gpu --no-pdf-header-footer `
    --run-all-compositor-stages-before-draw --virtual-time-budget=4000 `
    "--print-to-pdf=$pdf" "file:///$($html -replace '\\','/')"

if (-not (Test-Path $pdf)) { throw 'PDF was not produced.' }

$kb = [math]::Round((Get-Item $pdf).Length / 1KB, 1)
Write-Host "Wrote $pdf ($kb KB)" -ForegroundColor Green
Write-Host 'Now commit index.html and TyMoore_Resume.pdf together, then push.'
