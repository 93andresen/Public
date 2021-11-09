if (Test-Path "C:\Program Files\AutoHotkey\AutoHotkey.exe"){
    'Autohotkey Already Installed'
}  
else{
    Write-Host "Checking winget..."
    # Check if winget is installed
    if (Test-Path ~\AppData\Local\Microsoft\WindowsApps\winget.exe){
        'Winget Already Installed'
    }  
    else{
        # Installing winget from the Microsoft Store
        Write-Host "Winget not found, installing it now."
        Start-Process "ms-appinstaller:?source=https://aka.ms/getwinget"
        $nid = (Get-Process AppInstaller).Id
        Wait-Process -Id $nid
        Write-Host Winget Installed
    }
    Write-Host "Installing Autohotkey"
    winget install -e Lexikos.AutoHotkey | Out-Host
    Write-Host "Installed Autohotkey"
}

'Downloading ahk script to C:\zzz_temp'
if (Test-Path "C:\zzz_temp"){
}  
else{
    mkdir C:\zzz_temp
}
Set-Location C:\zzz_temp
# Source file location
$source = 'https://raw.githubusercontent.com/93andresen/Richard_Public/main/ahk_script_test_delete.ahk'
# Destination to save the file
$destination = 'ahk_script_test_delete.ahk'
#Download the file
Invoke-WebRequest -Uri $source -OutFile $destination
& "C:\Program Files\AutoHotkey\AutoHotkey.exe" c:\zzz_temp\ahk_script_test_delete.ahk
'Finished...'