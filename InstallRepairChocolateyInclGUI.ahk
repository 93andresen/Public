
bypass=Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;
runwait, powershell.exe %bypass% Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1

runwait, powershell.exe choco feature enable -n=allowGlobalConfirmation
runwait, powershell.exe choco feature enable -n=allowEmptyChecksums
runwait, powershell.exe choco upgrade chocolatey --force
runwait, powershell.exe choco unpackself --force


runwait, powershell.exe %bypass% choco upgrade chocolateygui --force --params="'/HidePackageDownloadCount=$false /PreventAutomatedOutdatedPackagesCheck=$false /PreventPreload=$false /ShowAggregatedSourceView=$false /UseDelayedSearch=$false /ExcludeInstalledPackages=$true /DefaultToTileViewForRemoteSource=$true /DefaultToTileViewForLocalSource=$true /ShowAdditionalPackageInformation=$true /ShowConsoleOutput=$false /UseKeyboardBindings=$true /UseLanguage=en /OutdatedPackagesCacheDurationInMinutes=10080'" -y
runwait, powershell.exe %bypass% choco upgrade chocolateygui --force --params="'/HidePackageDownloadCount=$false /PreventAutomatedOutdatedPackagesCheck=$false /PreventPreload=$false /ShowAggregatedSourceView=$false /UseDelayedSearch=$false /ExcludeInstalledPackages=$true /DefaultToTileViewForRemoteSource=$true /DefaultToTileViewForLocalSource=$true /ShowAdditionalPackageInformation=$true /ShowConsoleOutput=$false /UseKeyboardBindings=$true /UseLanguage=en /OutdatedPackagesCacheDurationInMinutes=10080 /global'" -y


runwait, powershell.exe chocolateyguicli feature enable --name="'ExcludeInstalledPackages'" --global
runwait, powershell.exe chocolateyguicli feature enable --name="'DefaultToTileViewForRemoteSource'" --global
runwait, powershell.exe chocolateyguicli feature enable --name="'DefaultToTileViewForLocalSource'" --global
runwait, powershell.exe chocolateyguicli feature disable --name="'HidePackageDownloadCount'" --global
runwait, powershell.exe chocolateyguicli feature disable --name="'PreventAutomatedOutdatedPackagesCheck'" --global
runwait, powershell.exe chocolateyguicli feature disable --name="'PreventPreload'" --global
runwait, powershell.exe chocolateyguicli feature enable --name="'ShowAdditionalPackageInformation'" --global
runwait, powershell.exe chocolateyguicli feature disable --name="'ShowAggregatedSourceView'" --global
runwait, powershell.exe chocolateyguicli feature enable --name="'ShowConsoleOutput'" --global
runwait, powershell.exe chocolateyguicli feature disable --name="'UseDelayedSearch'" --global
runwait, powershell.exe chocolateyguicli feature enable --name="'UseKeyboardBindings'" --global
runwait, powershell.exe chocolateyguicli config set --name="'OutdatedPackagesCacheDurationInMinutes'" --value="'10080'" --global
runwait, powershell.exe chocolateyguicli config set --name="'UseLanguage'" --value="'en'" --global

runwait, powershell.exe chocolateyguicli feature enable --name="'ExcludeInstalledPackages'"
runwait, powershell.exe chocolateyguicli feature enable --name="'DefaultToTileViewForRemoteSource'"
runwait, powershell.exe chocolateyguicli feature enable --name="'DefaultToTileViewForLocalSource'"
runwait, powershell.exe chocolateyguicli feature disable --name="'HidePackageDownloadCount'"
runwait, powershell.exe chocolateyguicli feature disable --name="'PreventAutomatedOutdatedPackagesCheck'"
runwait, powershell.exe chocolateyguicli feature disable --name="'PreventPreload'"
runwait, powershell.exe chocolateyguicli feature enable --name="'ShowAdditionalPackageInformation'"
runwait, powershell.exe chocolateyguicli feature disable --name="'ShowAggregatedSourceView'"
runwait, powershell.exe chocolateyguicli feature enable --name="'ShowConsoleOutput'"
runwait, powershell.exe chocolateyguicli feature disable --name="'UseDelayedSearch'"
runwait, powershell.exe chocolateyguicli feature enable --name="'UseKeyboardBindings'"
runwait, powershell.exe chocolateyguicli config set --name="'OutdatedPackagesCacheDurationInMinutes'" --value="'10080'"
runwait, powershell.exe chocolateyguicli config set --name="'UseLanguage'" --value="'en'"

runwait, powershell.exe chocolateyguicli.exe feature enable --name="'ExcludeInstalledPackages'" --global
runwait, powershell.exe chocolateyguicli.exe feature enable --name="'DefaultToTileViewForRemoteSource'" --global
runwait, powershell.exe chocolateyguicli.exe feature enable --name="'DefaultToTileViewForLocalSource'" --global
runwait, powershell.exe chocolateyguicli.exe feature disable --name="'HidePackageDownloadCount'" --global
runwait, powershell.exe chocolateyguicli.exe feature disable --name="'PreventAutomatedOutdatedPackagesCheck'" --global
runwait, powershell.exe chocolateyguicli.exe feature disable --name="'PreventPreload'" --global
runwait, powershell.exe chocolateyguicli.exe feature enable --name="'ShowAdditionalPackageInformation'" --global
runwait, powershell.exe chocolateyguicli.exe feature disable --name="'ShowAggregatedSourceView'" --global
runwait, powershell.exe chocolateyguicli.exe feature enable --name="'ShowConsoleOutput'" --global
runwait, powershell.exe chocolateyguicli.exe feature disable --name="'UseDelayedSearch'" --global
runwait, powershell.exe chocolateyguicli.exe feature enable --name="'UseKeyboardBindings'" --global
runwait, powershell.exe chocolateyguicli.exe config set --name="'OutdatedPackagesCacheDurationInMinutes'" --value="'10080'" --global
runwait, powershell.exe chocolateyguicli.exe config set --name="'UseLanguage'" --value="'en'" --global

runwait, powershell.exe chocolateyguicli.exe feature enable --name="'ExcludeInstalledPackages'"
runwait, powershell.exe chocolateyguicli.exe feature enable --name="'DefaultToTileViewForRemoteSource'"
runwait, powershell.exe chocolateyguicli.exe feature enable --name="'DefaultToTileViewForLocalSource'"
runwait, powershell.exe chocolateyguicli.exe feature disable --name="'HidePackageDownloadCount'"
runwait, powershell.exe chocolateyguicli.exe feature disable --name="'PreventAutomatedOutdatedPackagesCheck'"
runwait, powershell.exe chocolateyguicli.exe feature disable --name="'PreventPreload'"
runwait, powershell.exe chocolateyguicli.exe feature enable --name="'ShowAdditionalPackageInformation'"
runwait, powershell.exe chocolateyguicli.exe feature disable --name="'ShowAggregatedSourceView'"
runwait, powershell.exe chocolateyguicli.exe feature enable --name="'ShowConsoleOutput'"
runwait, powershell.exe chocolateyguicli.exe feature disable --name="'UseDelayedSearch'"
runwait, powershell.exe chocolateyguicli.exe feature enable --name="'UseKeyboardBindings'"
runwait, powershell.exe chocolateyguicli.exe config set --name="'OutdatedPackagesCacheDurationInMinutes'" --value="'10080'"
runwait, powershell.exe chocolateyguicli.exe config set --name="'UseLanguage'" --value="'en'"

runwait, powershell.exe "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature enable --name="'ExcludeInstalledPackages'" --global
runwait, powershell.exe "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature enable --name="'DefaultToTileViewForRemoteSource'" --global
runwait, powershell.exe "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature enable --name="'DefaultToTileViewForLocalSource'" --global
runwait, powershell.exe "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature disable --name="'HidePackageDownloadCount'" --global
runwait, powershell.exe "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature disable --name="'PreventAutomatedOutdatedPackagesCheck'" --global
runwait, powershell.exe "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature disable --name="'PreventPreload'" --global
runwait, powershell.exe "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature enable --name="'ShowAdditionalPackageInformation'" --global
runwait, powershell.exe "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature disable --name="'ShowAggregatedSourceView'" --global
runwait, powershell.exe "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature enable --name="'ShowConsoleOutput'" --global
runwait, powershell.exe "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature disable --name="'UseDelayedSearch'" --global
runwait, powershell.exe "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature enable --name="'UseKeyboardBindings'" --global
runwait, powershell.exe "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" config set --name="'OutdatedPackagesCacheDurationInMinutes'" --value="'10080'" --global
runwait, powershell.exe "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" config set --name="'UseLanguage'" --value="'en'" --global

runwait, powershell.exe "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature enable --name="'ExcludeInstalledPackages'"
runwait, powershell.exe "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature enable --name="'DefaultToTileViewForRemoteSource'"
runwait, powershell.exe "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature enable --name="'DefaultToTileViewForLocalSource'"
runwait, powershell.exe "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature disable --name="'HidePackageDownloadCount'"
runwait, powershell.exe "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature disable --name="'PreventAutomatedOutdatedPackagesCheck'"
runwait, powershell.exe "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature disable --name="'PreventPreload'"
runwait, powershell.exe "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature enable --name="'ShowAdditionalPackageInformation'"
runwait, powershell.exe "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature disable --name="'ShowAggregatedSourceView'"
runwait, powershell.exe "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature enable --name="'ShowConsoleOutput'"
runwait, powershell.exe "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature disable --name="'UseDelayedSearch'"
runwait, powershell.exe "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" feature enable --name="'UseKeyboardBindings'"
runwait, powershell.exe "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" config set --name="'OutdatedPackagesCacheDurationInMinutes'" --value="'10080'"
runwait, powershell.exe "C:\Program Files (x86)\Chocolatey GUI\ChocolateyGuiCli.exe" config set --name="'UseLanguage'" --value="'en'"
