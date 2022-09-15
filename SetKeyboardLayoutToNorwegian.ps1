$UserLanguageList = New-WinUserLanguageList -Language "no-NO"
$UserLanguageList.Add("no-NO")
Set-WinUserLanguageList -LanguageList $UserLanguageList -Force


