$ErrorActionPreference = 'Stop'

$repo = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$worktreeRoot = Join-Path (Split-Path $repo -Parent) 'notcherry-variant-worktrees'
$pidFile = Join-Path $repo '.variant-pids.json'

$variants = @(
  @{ Name = 'readable'; Branch = 'readable-editorial'; Port = 4321 },
  @{ Name = 'cobalt'; Branch = 'variant-cobalt-systems'; Port = 4322 },
  @{ Name = 'oxide'; Branch = 'variant-oxide-fieldnotes'; Port = 4323 },
  @{ Name = 'lime'; Branch = 'variant-lime-lab'; Port = 4324 }
)

New-Item -ItemType Directory -Force -Path $worktreeRoot | Out-Null
Push-Location $repo

try {
  $knownBranches = @(git branch --format='%(refname:short)')
  $currentBranch = (git branch --show-current).Trim()
  $pids = @()

  foreach ($variant in $variants) {
    if ($knownBranches -notcontains $variant.Branch) {
      throw "Missing branch: $($variant.Branch)"
    }

    if ($currentBranch -eq $variant.Branch) {
      $worktree = $repo
    }
    else {
      $worktree = Join-Path $worktreeRoot $variant.Name
      $gitMarker = Join-Path $worktree '.git'

      if (-not (Test-Path $gitMarker)) {
        if (Test-Path $worktree) {
          throw "Worktree path already exists and is not a Git worktree: $worktree"
        }

        git worktree add $worktree $variant.Branch | Out-Host
        if ($LASTEXITCODE -ne 0) {
          throw "Could not create worktree for branch: $($variant.Branch)"
        }
      }

      $sharedModules = Join-Path $repo 'node_modules'
      $variantModules = Join-Path $worktree 'node_modules'

      if (-not (Test-Path $variantModules)) {
        if (-not (Test-Path $sharedModules)) {
          npm install | Out-Host
        }

        cmd.exe /c "mklink /J `"$variantModules`" `"$sharedModules`"" | Out-Host
      }
    }

    $command = "cd /d `"$worktree`" && npm run dev -- --host 127.0.0.1 --port $($variant.Port)"
    $process = Start-Process -FilePath 'cmd.exe' -ArgumentList @('/k', $command) -PassThru
    $pids += [pscustomobject]@{
      Name = $variant.Name
      Branch = $variant.Branch
      Port = $variant.Port
      Worktree = $worktree
      Pid = $process.Id
    }
  }

  $pids | ConvertTo-Json | Set-Content -Path $pidFile

  Write-Host ''
  Write-Host 'Portfolio variants running:' -ForegroundColor Green
  foreach ($variant in $variants) {
    Write-Host ("  {0,-8} http://127.0.0.1:{1}" -f $variant.Name, $variant.Port)
  }
  Write-Host ''
  Write-Host 'Stop all with: .\scripts\stop-variants.ps1'
}
finally {
  Pop-Location
}
