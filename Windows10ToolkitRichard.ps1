Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072

'Downloaded files will be saved in C:\temp_Windows10ToolkitRichard'
if (Test-Path "C:\temp_Windows10ToolkitRichard"){
}  
else{
    mkdir C:\temp_Windows10ToolkitRichard
}
Set-Location C:\temp_Windows10ToolkitRichard

Write-Host "Creating Ststem Restore Point and naming it: Before_Running_Windows10ToolkitRichard"
Enable-ComputerRestore -Drive "C:\"
Checkpoint-Computer -Description "Before_Running_Windows10ToolkitRichard" -RestorePointType "MODIFY_SETTINGS"

$source = 'https://raw.githubusercontent.com/93andresen/Public/main/Windows10ToolkitRichard.ps1'
$destination = 'Windows10ToolkitRichard.ps1'
Invoke-WebRequest -Uri $source -OutFile $destination
'Downloading a copy of this script so i can make a task in task scheduler for automatic resume after reboots'

# INSTALLING CHOCOLATEY AND WINGET

if (Test-Path "C:\ProgramData\chocolatey\bin\choco.exe"){
    'Chocolatey Allready Installed'
}  
else{
    'Installing Chocolatey'
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}
choco feature enable -n=allowGlobalConfirmation -y

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

if (Test-Path "C:\Program Files\AutoHotkey\AutoHotkey.exe"){
    'Autohotkey Already Installed'
}  
else{
    choco install Autohotkey
    if (Test-Path "C:\Program Files\AutoHotkey\AutoHotkey.exe"){
        'Chocolatey Sucsessfully installed Autohotkey'
    }  
    else{
        winget install -e Lexikos.AutoHotkey | Out-Host
        if (Test-Path "C:\Program Files\AutoHotkey\AutoHotkey.exe"){
            'Chocolatey COULD NOT install Autohotkey'
            'Winget Sucsessfully installed Autohotkey'
        }  
        else{
            'Could not install Autohotkey with Winget OR Chocolatey!!!'
        }
    }
}


#RUNNING MY AHK_SCRIPTS - RunAsUser and RunAsAdmin

$source = 'https://raw.githubusercontent.com/93andresen/Public/main/RunAsAdminCOPY_WILL_NOT_SYNC.ahk'
$destination = 'RunAsAdminCOPY_WILL_NOT_SYNC.ahk'
Invoke-WebRequest -Uri $source -OutFile $destination
& "C:\Program Files\AutoHotkey\AutoHotkey.exe" c:\temp_Windows10ToolkitRichard\RunAsAdminCOPY_WILL_NOT_SYNC.ahk
'running c:\temp_Windows10ToolkitRichard\RunAsAdminCOPY_WILL_NOT_SYNC.ahk'

$source = 'https://raw.githubusercontent.com/93andresen/Public/main/RunAsUserCOPY_WILL_NOT_SYNC.ahk'
$destination = 'RunAsUserCOPY_WILL_NOT_SYNC.ahk'
Invoke-WebRequest -Uri $source -OutFile $destination
& "C:\Program Files\AutoHotkey\AutoHotkey.exe" c:\temp_Windows10ToolkitRichard\RunAsUserCOPY_WILL_NOT_SYNC.ahk
'running c:\temp_Windows10ToolkitRichard\RunAsUserCOPY_WILL_NOT_SYNC.ahk - THIS ALSO RUNS AS ADMIN'


#RUNNING MY ChrisTitusForkRichard

Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/93andresen/Public/main/Windows10ChrisTitusForkRichard.ps1'))
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;choco uninstall explorer-winconfig;choco install explorer-winconfig --params "'/SHOWEXTENSIONS:yes /SHOWFULLPATH:yes /SHOWHIDDEN:yes /SHOWCHECKBOXES:no /SHOWENCRYPTED:yes /SHOWPREVIEWPANE:yes /SHOWDETAILSPANE:no /SHOWDRIVESNOMEDIA:yes /USESHARINGWIZARD:yes'"
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/93andresen/Public/main/Windows10DebloaterSycnexForkRichard.ps1'))


#RUNNING MY AHK_SCRIPT - Windows10ToolkitRichard

$source = 'https://raw.githubusercontent.com/93andresen/Public/main/Windows10ToolkitRichard.ahk'
$destination = 'Windows10ToolkitRichard.ahk'
Invoke-WebRequest -Uri $source -OutFile $destination
& "C:\Program Files\AutoHotkey\AutoHotkey.exe" c:\temp_Windows10ToolkitRichard\Windows10ToolkitRichard.ahk
'running c:\temp_Windows10ToolkitRichard\Windows10ToolkitRichard.ahk'


