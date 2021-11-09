# GUI Specs
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



if (Test-Path "C:\Program Files\AutoHotkey\AutoHotkey.exe"){
    'Autohotkey Already Installed'
}  
else{
    Write-Host "Installing Autohotkey"
    winget install -e Lexikos.AutoHotkey | Out-Host
    Write-Host "Installed Autohotkey"
}

$Link = "https://raw.githubusercontent.com/93andresen/Richard_Public/main/ahk_script_test_delete.ahk"
$WebClient = New-Object System.Net.WebClient
$WebClient.DownloadFile("$Link","$env:USERPROFILE\Downloads\ahk_script_test_delete.ahk")


