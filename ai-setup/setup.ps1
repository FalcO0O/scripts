& {
    # 1. Locate GEMINI.md (locally if cloned, or fetch from GitHub if pasted into terminal)
    $localSource = $null
    if ($PSScriptRoot -and (Test-Path (Join-Path $PSScriptRoot "GEMINI.md"))) {
        $localSource = Join-Path $PSScriptRoot "GEMINI.md"
    } elseif (Test-Path ".\ai-setup\GEMINI.md") {
        $localSource = (Resolve-Path ".\ai-setup\GEMINI.md").Path
    } elseif (Test-Path ".\GEMINI.md") {
        $localSource = (Resolve-Path ".\GEMINI.md").Path
    }

    Write-Host "`n=== AI Rules Setup ===" -ForegroundColor Cyan
    Write-Host "1) Global"
    Write-Host "2) Local project directory"
    $choice = Read-Host "Select [1/2, default: 1]"
    if (-not $choice) { $choice = "1" }

    if ($choice -eq "2") {
        $targetDir = Read-Host "Target directory [default: .]"
        if (-not $targetDir) { $targetDir = (Get-Location).Path }
        $resolvedDir = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($targetDir)
        if (-not (Test-Path $resolvedDir)) {
            Write-Host "`n[!] Directory does not exist: $resolvedDir" -ForegroundColor Red
            exit 1
        }
    } else {
        $resolvedDir = Join-Path $env:USERPROFILE ".gemini"
        if (-not (Test-Path $resolvedDir)) {
            $create = Read-Host "Directory $resolvedDir does not exist. Create? [Y/n]"
            if ($create -and $create -match '^[nN]') {
                Write-Host "`n[i] Cancelled." -ForegroundColor Yellow
                exit 0
            }
            try {
                New-Item -ItemType Directory -Path $resolvedDir -Force -ErrorAction Stop | Out-Null
                Write-Host "[+] Created directory: $resolvedDir" -ForegroundColor Green
            } catch {
                Write-Host "`n[!] Failed to create directory ${resolvedDir}: $_" -ForegroundColor Red
                exit 1
            }
        }
    }

    $destFile = Join-Path $resolvedDir "GEMINI.md"

    # Check for existing file
    if (Test-Path $destFile) {
        Write-Host "`n[!] File already exists: $destFile" -ForegroundColor Yellow
        $overwrite = Read-Host "Overwrite? [y/N]"
        if ($overwrite -notmatch '^[yY]') {
            Write-Host "[i] Cancelled - existing file left unchanged." -ForegroundColor Yellow
            exit 0
        }
        try {
            Copy-Item -Path $destFile -Destination "$destFile.bak" -Force -ErrorAction Stop
            Write-Host "[i] Backup created at: $destFile.bak" -ForegroundColor Yellow
        } catch {
            Write-Host "`n[!] Failed to create backup: $_" -ForegroundColor Red
            exit 1
        }
    }

    # Install GEMINI.md
    try {
        if ($localSource) {
            Copy-Item -Path $localSource -Destination $destFile -Force -ErrorAction Stop
        } else {
            $url = "https://raw.githubusercontent.com/FalcO0O/scripts/master/ai-setup/GEMINI.md"
            Write-Host "Downloading GEMINI.md from GitHub..."
            Invoke-WebRequest -Uri $url -OutFile $destFile -ErrorAction Stop
        }
    } catch {
        Write-Host "`n[!] Installation failed: $_" -ForegroundColor Red
        exit 1
    }

    Write-Host "`n[+] Done! Installed GEMINI.md to:" -ForegroundColor Green
    Write-Host "    $destFile" -ForegroundColor Gray
    exit 0
}
