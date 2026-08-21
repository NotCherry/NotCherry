$ErrorActionPreference = 'SilentlyContinue'

$repo = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$pidFile = Join-Path $repo '.variant-pids.json'
$ports = 4321, 4322, 4323, 4324

function Stop-VariantPort([int] $port) {
  $processes = @(Get-CimInstance Win32_Process | Where-Object {
    $_.CommandLine -and $_.CommandLine -match "--port\s+$port(\s|$)"
  })

  foreach ($process in $processes) {
    taskkill.exe /PID $process.ProcessId /T /F | Out-Null
  }
}

if (Test-Path $pidFile) {
  $entries = @(Get-Content $pidFile | ConvertFrom-Json)

  foreach ($entry in $entries) {
    taskkill.exe /PID $entry.Pid /T /F | Out-Null
  }

  Remove-Item $pidFile -Force
}

foreach ($port in $ports) {
  Stop-VariantPort $port
}

Write-Host 'Variant dev servers stopped.' -ForegroundColor Yellow
Write-Host 'Git worktrees remain available for the next comparison.'
