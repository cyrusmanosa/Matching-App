$ErrorActionPreference = "Stop"
$avd = if ($env:ANDROID_AVD) { $env:ANDROID_AVD } else { "dating_phone" }
$root = Split-Path -Parent $PSScriptRoot
$frontend = Join-Path $root "frontend"

function Get-AndroidDeviceId {
  $lines = & flutter devices 2>$null
  foreach ($line in $lines) {
    if ($line -match "emulator-\d+") {
      return $Matches[0]
    }
    if ($line -match "android-" -and $line -match "\S+\s+(\S+)\s+android-") {
      return $Matches[1]
    }
  }
  return $null
}

if (-not (Get-AndroidDeviceId)) {
  Write-Host "Starting Android emulator: $avd"
  & flutter emulators --launch $avd
}

Write-Host "Waiting for Android device..."
$deviceId = $null
for ($i = 0; $i -lt 90; $i++) {
  $deviceId = Get-AndroidDeviceId
  if ($deviceId) {
    break
  }
  Start-Sleep -Seconds 2
}

if (-not $deviceId) {
  Write-Error "No Android emulator found. Create AVD '$avd' or plug in a phone."
  exit 1
}

Write-Host "Using device: $deviceId"
Set-Location $frontend
& flutter run -d $deviceId --device-timeout 120
exit $LASTEXITCODE
