# sync-mirror.ps1 - LOCAL ONLY. Refresh the OneDrive mirror and skla-site-final.zip from the canonical clone.
# Usage: powershell -NoProfile -ExecutionPolicy Bypass -File C:\Users\shash\src\skla-website\_pipeline\bin\sync-mirror.ps1 [-DryRun]
# The repo (GitHub main) is the source of truth; the OneDrive folder is a derived, read-only mirror.
param([switch]$DryRun)
$ErrorActionPreference = 'Stop'
$clone  = 'C:\Users\shash\src\skla-website'
$mirror = 'C:\Users\shash\OneDrive\Desktop\Website\SKLA Website'
$zip    = Join-Path $mirror 'skla-site-final.zip'

Write-Host "== git pull (clone: $clone)"
# git writes informational lines ("Already on 'main'") to stderr, which PowerShell 5.1 would turn into a
# terminating error under Stop - run the three calls quietly with errors downgraded, then check exit codes.
$ErrorActionPreference = 'Continue'
& git -C $clone fetch -q origin 2>&1 | Out-Null
& git -C $clone checkout -q main 2>&1 | Out-Null
& git -C $clone pull -q --ff-only origin main 2>&1 | Out-Null
if ($LASTEXITCODE -ne 0) { throw "git pull --ff-only failed (exit $LASTEXITCODE) - resolve the clone by hand" }
$ErrorActionPreference = 'Stop'
Write-Host "   main at $(& git -C $clone log --oneline -1)"

$excludeDirs  = @('.git', 'Backups', 'partner Info')
$excludeFiles = @('*.zip', '*.xlsx', 'website-build-prompt.md', 'ziXO8jNN', '.fuse_hidden*', 'CONTENT-STRATEGY.md', 'INSIGHTS-BRIEFS.md')
$args = @($clone, $mirror, '/MIR', '/R:2', '/W:2', '/NP', '/NDL', '/NJH', '/XD') + $excludeDirs + @('/XF') + $excludeFiles
if ($DryRun) { $args += '/L' }
Write-Host "== robocopy $(if ($DryRun) {'(DRY RUN - nothing copied or deleted)'} else {'(MIRROR)'})"
& robocopy @args | Select-Object -Last 12
# robocopy exit codes 0-7 are success variants
if ($LASTEXITCODE -gt 7) { throw "robocopy failed with exit code $LASTEXITCODE" }

if (-not $DryRun) {
  Write-Host "== integrity: every *.html in the mirror ends with </html>"
  $bad = Get-ChildItem $mirror -Filter *.html -File | Where-Object { -not ((Get-Content $_.FullName -Raw) -match '</html>\s*$') }
  if ($bad) { throw "Truncated HTML in mirror: $($bad.Name -join ', ')" }
  Write-Host "   ok ($((Get-ChildItem $mirror -Filter *.html -File).Count) files)"

  Write-Host "== rebuild $zip from the clone (bsdtar)"
  if (Test-Path $zip) { Remove-Item $zip -Force -Confirm:$false }
  & tar.exe -a -cf $zip --exclude=.git --exclude=.gitignore --exclude=.gitattributes --exclude=_pipeline --exclude=CLAUDE.md --exclude=README.md -C $clone .
  Add-Type -AssemblyName System.IO.Compression.FileSystem
  $z = [IO.Compression.ZipFile]::OpenRead($zip); $n = $z.Entries.Count; $z.Dispose()
  Write-Host "   zip entries: $n"
}
Write-Host "== done"
