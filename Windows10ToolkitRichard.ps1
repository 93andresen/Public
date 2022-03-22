s
Start-Transcript -Append C:\temp_Windows10ToolkitRichard\Windows10ToolkitRichardLOG.txt

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
    & "C:\Program Files\AutoHotkey\AutoHotkey.exe" C:\temp_Windows10ToolkitRichard\Public-main\Windows10ToolkitRichard.ahk $args[0] $args[1] $args[2] $args[3] $args[4] $args[5] $args[6] $args[7] $args[8] $args[9] $args[10] $args[11] $args[12] $args[13] $args[14] $args[15] $args[16] $args[17] $args[18] $args[19] $args[20] $args[21] $args[22] $args[23] $args[24] $args[25] $args[26] $args[27] $args[28] $args[29] $args[30] $args[31] $args[32] $args[33] $args[34] $args[35] $args[36] $args[37] $args[38] $args[39] $args[40] $args[41] $args[42] $args[43] $args[44] $args[45] $args[46] $args[47] $args[48] $args[49] $args[50] $args[51] $args[52] $args[53] $args[54] $args[55] $args[56] $args[57] $args[58] $args[59] $args[60] $args[61] $args[62] $args[63] $args[64] $args[65] $args[66] $args[67] $args[68] $args[69] $args[70] $args[71] $args[72] $args[73] $args[74] $args[75] $args[76] $args[77] $args[78] $args[79] $args[80] $args[81] $args[82] $args[83] $args[84] $args[85] $args[86] $args[87] $args[88] $args[89] $args[90] $args[91] $args[92] $args[93] $args[94] $args[95] $args[96] $args[97] $args[98] $args[99] $args[100] $args[101] $args[102] $args[103] $args[104] $args[105] $args[106] $args[107] $args[108] $args[109] $args[110] $args[111] $args[112] $args[113] $args[114] $args[115] $args[116] $args[117] $args[118] $args[119] $args[120] $args[121] $args[122] $args[123] $args[124] $args[125] $args[126] $args[127] $args[128] $args[129] $args[130] $args[131] $args[132] $args[133] $args[134] $args[135] $args[136] $args[137] $args[138] $args[139] $args[140] $args[141] $args[142] $args[143] $args[144] $args[145] $args[146] $args[147] $args[148] $args[149] $args[150] $args[151] $args[152] $args[153] $args[154] $args[155] $args[156] $args[157] $args[158] $args[159] $args[160] $args[161] $args[162] $args[163] $args[164] $args[165] $args[166] $args[167] $args[168] $args[169] $args[170] $args[171] $args[172] $args[173] $args[174] $args[175] $args[176] $args[177] $args[178] $args[179] $args[180] $args[181] $args[182] $args[183] $args[184] $args[185] $args[186] $args[187] $args[188] $args[189] $args[190] $args[191] $args[192] $args[193] $args[194] $args[195] $args[196] $args[197] $args[198] $args[199] $args[200]
    
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
    & "C:\Program Files\AutoHotkey\AutoHotkey.exe" C:\temp_Windows10ToolkitRichard\Public-main\Windows10ToolkitRichard.ahk $args[0] $args[1] $args[2] $args[3] $args[4] $args[5] $args[6] $args[7] $args[8] $args[9] $args[10] $args[11] $args[12] $args[13] $args[14] $args[15] $args[16] $args[17] $args[18] $args[19] $args[20] $args[21] $args[22] $args[23] $args[24] $args[25] $args[26] $args[27] $args[28] $args[29] $args[30] $args[31] $args[32] $args[33] $args[34] $args[35] $args[36] $args[37] $args[38] $args[39] $args[40] $args[41] $args[42] $args[43] $args[44] $args[45] $args[46] $args[47] $args[48] $args[49] $args[50] $args[51] $args[52] $args[53] $args[54] $args[55] $args[56] $args[57] $args[58] $args[59] $args[60] $args[61] $args[62] $args[63] $args[64] $args[65] $args[66] $args[67] $args[68] $args[69] $args[70] $args[71] $args[72] $args[73] $args[74] $args[75] $args[76] $args[77] $args[78] $args[79] $args[80] $args[81] $args[82] $args[83] $args[84] $args[85] $args[86] $args[87] $args[88] $args[89] $args[90] $args[91] $args[92] $args[93] $args[94] $args[95] $args[96] $args[97] $args[98] $args[99] $args[100] $args[101] $args[102] $args[103] $args[104] $args[105] $args[106] $args[107] $args[108] $args[109] $args[110] $args[111] $args[112] $args[113] $args[114] $args[115] $args[116] $args[117] $args[118] $args[119] $args[120] $args[121] $args[122] $args[123] $args[124] $args[125] $args[126] $args[127] $args[128] $args[129] $args[130] $args[131] $args[132] $args[133] $args[134] $args[135] $args[136] $args[137] $args[138] $args[139] $args[140] $args[141] $args[142] $args[143] $args[144] $args[145] $args[146] $args[147] $args[148] $args[149] $args[150] $args[151] $args[152] $args[153] $args[154] $args[155] $args[156] $args[157] $args[158] $args[159] $args[160] $args[161] $args[162] $args[163] $args[164] $args[165] $args[166] $args[167] $args[168] $args[169] $args[170] $args[171] $args[172] $args[173] $args[174] $args[175] $args[176] $args[177] $args[178] $args[179] $args[180] $args[181] $args[182] $args[183] $args[184] $args[185] $args[186] $args[187] $args[188] $args[189] $args[190] $args[191] $args[192] $args[193] $args[194] $args[195] $args[196] $args[197] $args[198] $args[199] $args[200]
    
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

