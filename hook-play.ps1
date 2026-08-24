# hook-play.ps1
# Hook script for Claude Code Stop hook
# Plays the creeper boom sound in background without blocking
# Usage: powershell -ExecutionPolicy Bypass -WindowStyle Hidden -File "hook-play.ps1"

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$soundPath = Join-Path $scriptDir "assets\creeper_booms.mp3"

if (-not (Test-Path $soundPath)) {
    exit 1
}

try {
    Add-Type -AssemblyName PresentationCore -ErrorAction Stop
    $player = New-Object System.Windows.Media.MediaPlayer
    $player.Open($soundPath)
    $player.Play()
    Start-Sleep -Seconds 5
    $player.Close()
} catch {
    # Silent fail - don't interrupt the user
    exit 1
}