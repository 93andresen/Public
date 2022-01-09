$action = New-ScheduledTaskAction -Execute 'C:\Program Files\AutoHotkey\AutoHotkey.exe' -Argument 'C:\temp_Windows10ToolkitRichard\Public-main\Windows10ToolkitRichard.ahk'
$trigger = New-ScheduledTaskTrigger -AtLogon
$user = "$env:computername\Administrator"
$name = \*
$settings = New-ScheduledTaskSettingsSet
$task = New-ScheduledTask -Password $password -User $user -Action $action -TaskName $name -User $principal -Trigger $trigger -Settings $settings
Register-ScheduledTask $task -Force