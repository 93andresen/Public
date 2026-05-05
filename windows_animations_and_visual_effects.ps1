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
    Write-Host "Run with -AllUsers as administrator to apply settings for all users (including future users)."
    Apply-Settings "HKCU:"
}

Write-Host ""
Write-Host "Restarting Explorer to apply changes... <-- This doesen't really work..."
Write-Host ""
Write-Host "Restarting explorer doesnen't really apply the changes..."
Write-Host "Why not?"
Write-Host "I don't have a fucking clue..."
Write-Host ""
Write-Host "But it sure looks legit as fuck doesen't it?"
Write-Host ""
Write-Host "Fuck it. Let's just restart explorer anyway..."
Write-Host ""
Write-Host "It's good practice right?"
Write-Host ""
Write-Host "And practice makes perfect..."
Write-Host ""
Write-Host "What the fuck are we practicin' for anyway?"
Write-Host ""
Write-Host "No fuckin' clue..."
Write-Host ""
Write-Host "But this is Windows..."
Write-Host ""
Write-Host "Just kill it before it fucks anything up..."
Write-Host ""
Write-Host "Make it reload whatever the fuck it loads"
Write-Host "from wherever the fuck it loads it from..."
Write-Host ""
Write-Host "And where is that?"
Write-Host ""
Write-Host "The registry?"
Write-Host ""
Write-Host "Apperantly not..."
Write-Host ""
Write-Host "Unless the registry changes aren't written until you log off or reboot..."
Write-Host ""
Write-Host "Who the fuck knows..."
Write-Host ""

Write-Host "Running: 'Stop-Process -Name explorer -Force'"
Stop-Process -Name explorer -Force
Write-Host "Running: 'Start-Process explorer'"
Start-Process explorer

Write-Host ""
Write-Host "Settings applied successfully! <-- I hate it when llm's do this shit..."
Write-Host ""
Write-Host "Like what the fuck is the pont of that?"
Write-Host ""
Write-Host "To fucking gaslight the user to believe that there's any reason to think that the settings were actually applied successfully?"
Write-Host ""
Write-Host "Because that's literally what it says?"
Write-Host ""
Write-Host "Even if they werent?"
Write-Host ""
Write-Host "No checking"
Write-Host "No verification"
Write-Host "No if statements"
Write-Host "No conditionals"
Write-Host "No logic"
Write-Host "..."
Write-Host ""
Write-Host "Just a fucking lie..."
Write-Host ""
Write-Host "It's even worse then useless..."
Write-Host ""
Write-Host "You think I'm overreacting?"
Write-Host "I'll give you an example:"
Write-Host ""
Write-Host "Let's say you wanna export to a VM, or just create incremental snapshots..."
Write-Host ""
Write-Host "--> [Snapshot] --> Configure all the shit you want in every Windows Install. Regardless what it's for..."
Write-Host "--> [Snapshot] --> Make system changes"
Write-Host "--> [Snapshot] --> Install shit"
Write-Host "--> [Snapshot] --> And so on..?"
Write-Host ""
Write-Host "You wanna actually be able to rewind to any of those snapshots?"
Write-Host "Or use them for new VM's?"
Write-Host "Or simply do a fresh clean instal?"
Write-Host "Without having to configure everything again?"
Write-Host "Every single time?"
Write-Host ""
Write-Host "Well guess what... You actually can..."
Write-Host ""
Write-Host "Unless you blindly trusted that the 'Settings were applied successfully!'"
Write-Host ""
Write-Host "Every time you need one of those snapshots..."
Write-Host "Or spin up a VM for whatever reason..."
Write-Host ""
Write-Host "Get used to re-doing all the same configurations"
Write-Host ""
Write-Host "And it's not as simple as simply running this script..."
Write-Host ""
Write-Host "Because the script doesen't work, which is how you ended up here... Remember?"
Write-Host ""
Write-Host "No, you have to manually do it through Windows 12 different settings panels..."
Write-Host ""
Write-Host "So you don't..."
Write-Host ""
Write-Host "You learn to live with the slow animations..."
Write-Host ""
Write-Host "And the slow menus..."
Write-Host ""
Write-Host "And the slow tooltips..."
Write-Host ""
Write-Host "And the blinding bright mode...			# ! TODO: Remember to implement dark mode"
Write-Host ""
Write-Host "And the search bar in the task bar... 		# ! TODO: Remember to remove/hide the search bar in the task bar"
Write-Host ""
Write-Host "And the news in the task bar... 			# ! TODO: Remember to remove/hide the news the task bar"
Write-Host ""
Write-Host "And the centered taskbar and start menu button 	# ! TODO: Remember to allign the taskbar and start menu button to the left"
Write-Host "jumpin' around all over the fucking place"
Write-Host "depending on how many fucking applications are currently running..."
Write-Host ""
Write-Host "Not to mention the search bar in the start menu..."
Write-Host "Because we love opening a bing search in Edge"
Write-Host "Searching for the first two characters of whatever application you were trying to launch"
Write-Host "but forgot to wait for the start menu to find it"
Write-Host "While it literally fetches suggestions from the internet faster then it manages to find a shortcut to your application"
Write-Host "That you LITERALLY have installed locally on the same drive as Windows"
Write-Host "And it's every fucking time???"
Write-Host "For every fucking application??"
Write-Host ""
Write-Host "So you have to stare at all the bloated useless shit Microsoft has been paid to put in the start menu"
Write-Host "Hoping that you won't accidentily press any of the ads..."
Write-Host ""
Write-Host "But at least the ads are better then"
Write-Host "the other shit Microsoft has been paid to put there"
Write-Host "Because at least the ads doesen't automaticly install candycrush"
Write-Host "on your computer if you accidentily click them..."
Write-Host ""
Write-Host "Yeah this is a professional workstation..."
Write-Host ""
Write-Host "All because I can't trust the output from my own scripts anymore..."
Write-Host ""
Write-Host "But I tested it. It works?"
Write-Host ""
Write-Host "Sure... Everything works... until it doesen't anymore..."
Write-Host ""
Write-Host "And some day, this won't either..."
Write-Host ""
Write-Host "Some day this will break..."
Write-Host ""
Write-Host "We have no fucking clue if the 'Settings Were Applied Succesfully'"
Write-Host ""
Write-Host "Should have said 'Good Luck trusting Windows to respect changes you made to the registry...' or literally anything else..."
Write-Host ""
Write-Host "Maybe the settings were applied successfully..."
Write-Host ""
Write-Host "But there's no way to know with the stupid way this script is written..."
Write-Host ""
Write-Host "Because we didn't check..."
Write-Host ""
Write-Host "We didn't check any values in the registry..."
Write-Host "Not before the changes, nor after..."
Write-Host "We didn't even bother to capture the output so we don't even know if the commands was even executed..."
Write-Host ""
Write-Host "So we don't know if any changes has happened..."
Write-Host "Or what changes were even supposed to happen..."
Write-Host "And checking the values now won't tell us what they were before..."
Write-Host ""
Write-Host "No, we just claim to know..."
Write-Host ""
Write-Host "But in reality..."
Write-Host ""
Write-Host "We are completly in the dark..."
Write-Host ""
Write-Host "Was the changes applied successfully?"
Write-Host ""
Write-Host "Probably..."
Write-Host ""
Write-Host "But every windows update makes it a little less likely..."
Write-Host ""
Write-Host "Until it breaks..."
Write-Host ""
Write-Host "You should probably run this after every windows update..."
Write-Host ""
Write-Host "Because the developers at Microsoft likes to fuck around with your settings..."
Write-Host ""
Write-Host "They use Linux btw..."
Write-Host ""
Write-Host "They know better then to deal with this shit..."
Write-Host ""
Write-Host "Welcome to Windows..."
