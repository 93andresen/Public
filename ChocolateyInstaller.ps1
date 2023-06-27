# INSTALLING CHOCOLATEY
Set-ExecutionPolicy RemoteSigned -scope CurrentUser

if (Test-Path "C:\ProgramData\chocolatey\bin\choco.exe"){
    'Chocolatey Allready Installed'
}  
else{
    'Installing Chocolatey'
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}
choco feature enable -n useRememberedArgumentsForUpgrades
choco feature enable -n allowEmptyChecksums
choco feature enable -n allowEmptyChecksumsSecure
choco feature enable -n AllowGlobalConfirmation
choco config set cacheLocation C:\zzz_Chocolatey_Cache

#Set environment variables so the above options are true when directly calling Chocolatey functions/commands:
[Environment]::SetEnvironmentVariable("ChocolateyAllowEmptyChecksums", $true)
[Environment]::SetEnvironmentVariable("ChocolateyAllowEmptyChecksumsSecure", $true)
[Environment]::SetEnvironmentVariable("ChocolateyToolsLocation", "$env:ChocolateyInstall\Tools")