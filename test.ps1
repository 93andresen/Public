$path = 
$action = New-ScheduledTaskAction -Execute 'C:\Program Files\AutoHotkey\AutoHotkey.exe' -Argument 'C:\temp_Windows10ToolkitRichard\Public-main\Windows10ToolkitRichard.ahk'
$trigger = New-ScheduledTaskTrigger -AtLogon
$settings = New-ScheduledTaskSettingsSet
$task = New-ScheduledTask -User "NT AUTHORITY\SYSTEM" -Action $action -TaskName "\*" -User $principal -Trigger $trigger -Settings $settings
Register-ScheduledTask $task -Force