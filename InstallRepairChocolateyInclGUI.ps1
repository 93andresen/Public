Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
choco feature enable -n=allowGlobalConfirmation
choco feature enable -n=allowEmptyChecksums
choco upgrade chocolatey --force -y
choco feature enable -n=allowGlobalConfirmation
choco feature enable -n=allowEmptyChecksums
choco unpackself --force -y
choco feature enable -n=allowGlobalConfirmation
choco feature enable -n=allowEmptyChecksums


$source = 'https://raw.githubusercontent.com/93andresen/Public/main/chocolatey.config'
$path = 'chocolatey.config'
Invoke-WebRequest -Uri $source -OutFile $path
Copy-Item -Path $path -Destination "C:\ProgramData\chocolatey\config\chocolatey.config"


choco config set cacheLocation C:\zzz_Chocolatey_Cache -y
choco uninstall chocolateygui --force --params="'/HidePackageDownloadCount=$false /PreventAutomatedOutdatedPackagesCheck=$false /PreventPreload=$false /ShowAggregatedSourceView=$false /UseDelayedSearch=$false /ExcludeInstalledPackages=$true /DefaultToTileViewForRemoteSource=$true /DefaultToTileViewForLocalSource=$true /ShowAdditionalPackageInformation=$true /ShowConsoleOutput=$false /UseKeyboardBindings=$true /UseLanguage=en /OutdatedPackagesCacheDurationInMinutes=10080'" -y
choco upgrade chocolateygui --force --params="'/HidePackageDownloadCount=$false /PreventAutomatedOutdatedPackagesCheck=$false /PreventPreload=$false /ShowAggregatedSourceView=$false /UseDelayedSearch=$false /ExcludeInstalledPackages=$true /DefaultToTileViewForRemoteSource=$true /DefaultToTileViewForLocalSource=$true /ShowAdditionalPackageInformation=$true /ShowConsoleOutput=$false /UseKeyboardBindings=$true /UseLanguage=en /OutdatedPackagesCacheDurationInMinutes=10080'" -y
choco upgrade chocolateygui --force --params="'/HidePackageDownloadCount=$false /PreventAutomatedOutdatedPackagesCheck=$false /PreventPreload=$false /ShowAggregatedSourceView=$false /UseDelayedSearch=$false /ExcludeInstalledPackages=$true /DefaultToTileViewForRemoteSource=$true /DefaultToTileViewForLocalSource=$true /ShowAdditionalPackageInformation=$true /ShowConsoleOutput=$false /UseKeyboardBindings=$true /UseLanguage=en /OutdatedPackagesCacheDurationInMinutes=10080 /global'" -y
chocolateyguicli feature enable --name="'ExcludeInstalledPackages'" --global
chocolateyguicli feature enable --name="'DefaultToTileViewForRemoteSource'" --global
chocolateyguicli feature enable --name="'DefaultToTileViewForLocalSource'" --global
chocolateyguicli feature disable --name="'HidePackageDownloadCount'" --global
chocolateyguicli feature disable --name="'PreventAutomatedOutdatedPackagesCheck'" --global
chocolateyguicli feature disable --name="'PreventPreload'" --global
chocolateyguicli feature enable --name="'ShowAdditionalPackageInformation'" --global
chocolateyguicli feature disable --name="'ShowAggregatedSourceView'" --global
chocolateyguicli feature enable --name="'ShowConsoleOutput'" --global
chocolateyguicli feature disable --name="'UseDelayedSearch'" --global
chocolateyguicli feature enable --name="'UseKeyboardBindings'" --global
chocolateyguicli config set --name="'OutdatedPackagesCacheDurationInMinutes'" --value="'10080'" --global
chocolateyguicli config set --name="'UseLanguage'" --value="'en'" --global
chocolateyguicli feature enable --name="'ExcludeInstalledPackages'"
chocolateyguicli feature enable --name="'DefaultToTileViewForRemoteSource'"
chocolateyguicli feature enable --name="'DefaultToTileViewForLocalSource'"
chocolateyguicli feature disable --name="'HidePackageDownloadCount'"
chocolateyguicli feature disable --name="'PreventAutomatedOutdatedPackagesCheck'"
chocolateyguicli feature disable --name="'PreventPreload'"
chocolateyguicli feature enable --name="'ShowAdditionalPackageInformation'"
chocolateyguicli feature disable --name="'ShowAggregatedSourceView'"
chocolateyguicli feature enable --name="'ShowConsoleOutput'"
chocolateyguicli feature disable --name="'UseDelayedSearch'"
chocolateyguicli feature enable --name="'UseKeyboardBindings'"
chocolateyguicli config set --name="'OutdatedPackagesCacheDurationInMinutes'" --value="'10080'"
chocolateyguicli config set --name="'UseLanguage'" --value="'en'"
chocolateyguicli.exe feature enable --name="'ExcludeInstalledPackages'" --global
chocolateyguicli.exe feature enable --name="'DefaultToTileViewForRemoteSource'" --global
chocolateyguicli.exe feature enable --name="'DefaultToTileViewForLocalSource'" --global
chocolateyguicli.exe feature disable --name="'HidePackageDownloadCount'" --global
chocolateyguicli.exe feature disable --name="'PreventAutomatedOutdatedPackagesCheck'" --global
chocolateyguicli.exe feature disable --name="'PreventPreload'" --global
chocolateyguicli.exe feature enable --name="'ShowAdditionalPackageInformation'" --global
chocolateyguicli.exe feature disable --name="'ShowAggregatedSourceView'" --global
chocolateyguicli.exe feature enable --name="'ShowConsoleOutput'" --global
chocolateyguicli.exe feature disable --name="'UseDelayedSearch'" --global
chocolateyguicli.exe feature enable --name="'UseKeyboardBindings'" --global
chocolateyguicli.exe config set --name="'OutdatedPackagesCacheDurationInMinutes'" --value="'10080'" --global
chocolateyguicli.exe config set --name="'UseLanguage'" --value="'en'" --global
chocolateyguicli.exe feature enable --name="'ExcludeInstalledPackages'"
chocolateyguicli.exe feature enable --name="'DefaultToTileViewForRemoteSource'"
chocolateyguicli.exe feature enable --name="'DefaultToTileViewForLocalSource'"
chocolateyguicli.exe feature disable --name="'HidePackageDownloadCount'"
chocolateyguicli.exe feature disable --name="'PreventAutomatedOutdatedPackagesCheck'"
chocolateyguicli.exe feature disable --name="'PreventPreload'"
chocolateyguicli.exe feature enable --name="'ShowAdditionalPackageInformation'"
chocolateyguicli.exe feature disable --name="'ShowAggregatedSourceView'"
chocolateyguicli.exe feature enable --name="'ShowConsoleOutput'"
chocolateyguicli.exe feature disable --name="'UseDelayedSearch'"
chocolateyguicli.exe feature enable --name="'UseKeyboardBindings'"
chocolateyguicli.exe config set --name="'OutdatedPackagesCacheDurationInMinutes'" --value="'10080'"
chocolateyguicli.exe config set --name="'UseLanguage'" --value="'en'"
& "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature enable --name="'ExcludeInstalledPackages'" --global
& "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature enable --name="'DefaultToTileViewForRemoteSource'" --global
& "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature enable --name="'DefaultToTileViewForLocalSource'" --global
& "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature disable --name="'HidePackageDownloadCount'" --global
& "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature disable --name="'PreventAutomatedOutdatedPackagesCheck'" --global
& "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature disable --name="'PreventPreload'" --global
& "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature enable --name="'ShowAdditionalPackageInformation'" --global
& "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature disable --name="'ShowAggregatedSourceView'" --global
& "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature enable --name="'ShowConsoleOutput'" --global
& "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature disable --name="'UseDelayedSearch'" --global
& "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature enable --name="'UseKeyboardBindings'" --global
& "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" config set --name="'OutdatedPackagesCacheDurationInMinutes'" --value="'10080'" --global
& "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" config set --name="'UseLanguage'" --value="'en'" --global
& "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature enable --name="'ExcludeInstalledPackages'"
& "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature enable --name="'DefaultToTileViewForRemoteSource'"
& "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature enable --name="'DefaultToTileViewForLocalSource'"
& "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature disable --name="'HidePackageDownloadCount'"
& "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature disable --name="'PreventAutomatedOutdatedPackagesCheck'"
& "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature disable --name="'PreventPreload'"
& "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature enable --name="'ShowAdditionalPackageInformation'"
& "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature disable --name="'ShowAggregatedSourceView'"
& "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature enable --name="'ShowConsoleOutput'"
& "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature disable --name="'UseDelayedSearch'"
& "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature enable --name="'UseKeyboardBindings'"
& "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" config set --name="'OutdatedPackagesCacheDurationInMinutes'" --value="'10080'"
& "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" config set --name="'UseLanguage'" --value="'en'"