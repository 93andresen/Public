

Start-Transcript -Append C:\temp_Windows10ToolkitRichard\Windows10ToolkitRichardLOG.txt




$arg0 = $arg[0]
$arg1 = $arg[1]
$arg2 = $arg[2]
$arg3 = $arg[3]
$arg4 = $arg[4]
$arg5 = $arg[5]
$arg6 = $arg[6]
$arg7 = $arg[7]
$arg8 = $arg[8]
$arg9 = $arg[9]



Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072

'Downloaded files will be saved in C:\temp_Windows10ToolkitRichard'
Set-Location C:\temp_Windows10ToolkitRichard -ErrorAction SilentlyContinue
if (Test-Path "C:\Program Files\AutoHotkey\AutoHotkey.exe"){
    'C:\temp_Windows10ToolkitRichard Allready Exists - Overwriting it'
}
else{
    mkdir C:\temp_Windows10ToolkitRichard
}
$source = 'https://github.com/93andresen/Public/archive/refs/heads/main.zip'
$destination = 'C:\temp_Windows10ToolkitRichard\Public-main.zip'
Invoke-WebRequest -Uri $source -OutFile $destination
'Downloading 93andresen Public Folder as zip'
Expand-Archive -Force C:\temp_Windows10ToolkitRichard\Public-main.zip C:\temp_Windows10ToolkitRichard
#Remove-Item -LiteralPath "C:\temp_Windows10ToolkitRichard\Public-main.zip" -Force

# INSTALLING CHOCOLATEY

if (Test-Path "C:\ProgramData\chocolatey\bin\choco.exe"){
    'Chocolatey Allready Installed'
}  
else{
    'Installing Chocolatey'
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}
choco feature enable -n=allowGlobalConfirmation
choco feature enable -n allowEmptyChecksums

if (Test-Path "C:\Program Files\AutoHotkey\AutoHotkey.exe"){
    #RUNNING MY AHK_SCRIPT - Windows10ToolkitRichard
    'running c:\temp_Windows10ToolkitRichard\Windows10ToolkitRichard.ahk'
    & "C:\Program Files\AutoHotkey\AutoHotkey.exe" C:\temp_Windows10ToolkitRichard\Public-main\Windows10ToolkitRichard.ahk $arg1
    
    #RUNNING MY AHK_SCRIPTS - RunAsUser and RunAsAdmin
    'running C:\temp_Windows10ToolkitRichard\Public-main\RunAsAdminCOPY_WILL_NOT_SYNC.ahk'
    & "C:\Program Files\AutoHotkey\AutoHotkey.exe" C:\temp_Windows10ToolkitRichard\Public-main\RunAsAdminCOPY_WILL_NOT_SYNC.ahk
    'running C:\temp_Windows10ToolkitRichard\Public-main\RunAsUserCOPY_WILL_NOT_SYNC.ahk - THIS ALSO RUNS AS ADMIN'
    & "C:\Program Files\AutoHotkey\AutoHotkey.exe" C:\temp_Windows10ToolkitRichard\Public-main\RunAsUserCOPY_WILL_NOT_SYNC.ahk
}


# INSTALLING WINGET

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
    choco install Autohotkey -y
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
    #RUNNING MY AHK_SCRIPT - Windows10ToolkitRichard
    'running c:\temp_Windows10ToolkitRichard\Windows10ToolkitRichard.ahk'
    & "C:\Program Files\AutoHotkey\AutoHotkey.exe" C:\temp_Windows10ToolkitRichard\Public-main\Windows10ToolkitRichard.ahk
    
    #RUNNING MY AHK_SCRIPTS - RunAsUser and RunAsAdmin
    'running C:\temp_Windows10ToolkitRichard\Public-main\RunAsAdminCOPY_WILL_NOT_SYNC.ahk'
    & "C:\Program Files\AutoHotkey\AutoHotkey.exe" C:\temp_Windows10ToolkitRichard\Public-main\RunAsAdminCOPY_WILL_NOT_SYNC.ahk
    'running C:\temp_Windows10ToolkitRichard\Public-main\RunAsUserCOPY_WILL_NOT_SYNC.ahk - THIS ALSO RUNS AS ADMIN'
    & "C:\Program Files\AutoHotkey\AutoHotkey.exe" C:\temp_Windows10ToolkitRichard\Public-main\RunAsUserCOPY_WILL_NOT_SYNC.ahk
}



function Delete-FolderAndContents {
    # http://stackoverflow.com/a/9012108

    param(
        [Parameter(Mandatory=$true, Position=1)] [string] $folder_path
    )

    process {
        $child_items = ([array] (Get-ChildItem -Path $folder_path -Recurse -Force))
        if ($child_items) {
            $null = $child_items | Remove-Item -Force -Recurse
        }
        $null = Remove-Item $folder_path -Force
    }
}

