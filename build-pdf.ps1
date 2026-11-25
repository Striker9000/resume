# Regenerates both resume PDFs from their HTML pages using headless Chrome.
# Each PDF and its page share one source file, so they cannot drift apart.
#   index.html    -> TyMoore_Resume.pdf          (Applied AI resume)
#   sysadmin.html -> TyMoore_Resume_Systems.pdf  (Windows/Linux systems engineer resume)

$ErrorActionPreference = 'Stop'

$root = $PSScriptRoot

$chrome = @(
    "$env:ProgramFiles\Google\Chrome\Application\chrome.exe",
    "${env:ProgramFiles(x86)}\Google\Chrome\Application\chrome.exe",
    "$env:LOCALAPPDATA\Google\Chrome\Application\chrome.exe",
    "${env:ProgramFiles(x86)}\Microsoft\Edge\Application\msedge.exe"
) | Where-Object { Test-Path $_ } | Select-Object -First 1

if (-not $chrome) { throw 'Chrome or Edge not found. Install one, or edit the paths above.' }
Write-Host "Rendering with: $chrome"

$pairs = @(
    @{ Html = 'index.html';    Pdf = 'TyMoore_Resume.pdf' },
    @{ Html = 'sysadmin.html'; Pdf = 'TyMoore_Resume_Systems.pdf' }
)

foreach ($p in $pairs) {
    $html = Join-Path $root $p.Html
    $pdf  = Join-Path $root $p.Pdf
    if (-not (Test-Path $html)) { throw "Missing source file: $html" }
    if (Test-Path $pdf) { Remove-Item $pdf -Force }

    $chromeArgs = @('--headless=new','--disable-gpu','--no-pdf-header-footer',
              '--run-all-compositor-stages-before-draw','--virtual-time-budget=4000',
              "--print-to-pdf=$pdf", "file:///$($html -replace '\\','/')")
    Start-Process -FilePath $chrome -ArgumentList $chromeArgs -Wait -WindowStyle Hidden

    if (-not (Test-Path $pdf)) { throw "PDF was not produced: $pdf" }
    $kb = [math]::Round((Get-Item $pdf).Length / 1KB, 1)
    Write-Host "Wrote $pdf ($kb KB)" -ForegroundColor Green
}

Write-Host 'Now commit the HTML pages and both PDFs together, then push.'
