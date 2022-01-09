$action = New-ScheduledTaskAction -Execute 'C:\Program Files\AutoHotkey\AutoHotkey.exe' -Argument 'C:\temp_Windows10ToolkitRichard\Public-main\Windows10ToolkitRichard.ahk'
$trigger = New-ScheduledTaskTrigger -AtLogon
$principal = "$env:computername\Administrator"
$settings = New-ScheduledTaskSettingsSet
$task = New-ScheduledTask -Action $action -Principal $principal -Trigger $trigger -Settings $settings
Register-ScheduledTask T1 $task