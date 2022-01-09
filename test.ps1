$folder_path = C:\temp_Windows10ToolkitRichard
Delete-FolderAndContents

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