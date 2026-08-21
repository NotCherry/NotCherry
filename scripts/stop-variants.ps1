$ErrorActionPreference = 'SilentlyContinue'

$repo = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$pidFile = Join-Path $repo '.variant-pids.json'

if (Test-Path $pidFile) {
  $entries = @(Get-Content $pidFile | ConvertFrom-Json)

  foreach ($entry in $entries) {
    taskkill.exe /PID $entry.Pid /T /F | Out-Null
  }

  Remove-Item $pidFile -Force
}

Write-Host 'Variant dev servers stopped.' -ForegroundColor Yellow
Write-Host 'Git worktrees remain available for the next comparison.'
