param(
    [switch]$AllUsers
)

function Ensure-RegistryPath {
    param (
        [string]$Path
    )
    if (-not (Test-Path $Path)) {
        New-Item -Path $Path -Force | Out-Null
    }
}

function Apply-Settings {
    param (
        [string]$RegistryHive
    )
    
    # Ensure paths exist
    Ensure-RegistryPath "$RegistryHive\Control Panel\Desktop"
    Ensure-RegistryPath "$RegistryHive\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects"
    Ensure-RegistryPath "$RegistryHive\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
    Ensure-RegistryPath "$RegistryHive\Control Panel\Desktop\WindowMetrics"
    Ensure-RegistryPath "$RegistryHive\Software\Microsoft\Windows\DWM"
    
    # Menu and Response Settings
    Set-ItemProperty -Path "$RegistryHive\Control Panel\Desktop" -Name "MenuShowDelay" -Value "0"
    Set-ItemProperty -Path "$RegistryHive\Control Panel\Desktop" -Name "KeyboardDelay" -Value "0"

    # Visual Effects - Main
    Set-ItemProperty -Path "$RegistryHive\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" -Name "VisualFXSetting" -Value 3
    Set-ItemProperty -Path "$RegistryHive\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ListviewAlphaSelect" -Value 1
    Set-ItemProperty -Path "$RegistryHive\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ListviewShadow" -Value 0

    # Animation Settings
    Set-ItemProperty -Path "$RegistryHive\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarAnimations" -Value 0
    Set-ItemProperty -Path "$RegistryHive\Control Panel\Desktop\WindowMetrics" -Name "MinAnimate" -Value "0"
    Set-ItemProperty -Path "$RegistryHive\Control Panel\Desktop" -Name "UserPreferencesMask" -Value ([byte[]](144,18,3,128,16,0,0,0))

    # Functional Features
    Set-ItemProperty -Path "$RegistryHive\Software\Microsoft\Windows\DWM" -Name "EnableAeroPeek" -Value 1
    Set-ItemProperty -Path "$RegistryHive\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "EnableBalloonTips" -Value 1

    # Additional Performance Settings
    Set-ItemProperty -Path "$RegistryHive\Control Panel\Desktop" -Name "DragFullWindows" -Value "1"
    Set-ItemProperty -Path "$RegistryHive\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "SmoothScroll" -Value 1
}

if ($AllUsers) {
    # Check for admin rights
    if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
        Write-Error "Please run as administrator when using -AllUsers"
        exit
    }

    Write-Host "Applying settings for all users (including future users)..."
    
    # Mount HKU drive if it doesn't exist
    if (-not (Get-PSDrive -Name HKU -ErrorAction SilentlyContinue)) {
        New-PSDrive -PSProvider Registry -Name HKU -Root HKEY_USERS | Out-Null
    }
    
    # Load and modify default user profile
    $defaultUserPath = "C:\Users\Default\NTUSER.DAT"
    Write-Host "Loading default user profile..."
    reg load "HKU\Default" $defaultUserPath
    Start-Sleep -Seconds 2  # Give it time to load
    
    # Apply settings to default profile
    Apply-Settings "HKU:\Default"
    
    # Force release handles before unloading
    [gc]::Collect()
    Start-Sleep -Seconds 2
    
    # Unload default profile
    Write-Host "Unloading default user profile..."
    reg unload "HKU\Default"
    
    # Apply to all existing users
    Get-CimInstance -Class Win32_UserProfile | Where-Object { !$_.Special } | ForEach-Object {
        $sid = $_.SID
        Write-Host "Applying settings for user SID: $sid"
        Apply-Settings "Registry::HKEY_USERS\$sid"
    }
}
else {
    Write-Host "Applying settings for current user only..."
    Apply-Settings "HKCU:"
}

# Restart Explorer to apply changes
Write-Host "Restarting Explorer to apply changes..."
Stop-Process -Name explorer -Force
Start-Process explorer

Write-Host "Settings applied successfully!"
