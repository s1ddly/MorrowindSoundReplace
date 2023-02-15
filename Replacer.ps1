Function Get-Folder($initialDirectory="")

{
    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms")|Out-Null

    $foldername = New-Object System.Windows.Forms.FolderBrowserDialog
    $foldername.Description = "Select a folder"
    $foldername.rootfolder = "MyComputer"
    $foldername.SelectedPath = $initialDirectory

    if($foldername.ShowDialog((New-Object System.Windows.Forms.Form -Property @{TopMost = $true })) -eq "OK")
    {
        $folder += $foldername.SelectedPath
    }
    return $folder
}

$mwfolder = Get-Folder

echo "$mwfolder\Data Files\Sound"

If(Test-Path -Path $mwfolder\Morrowind.exe -PathType Leaf){
    echo "yeet"
} Else {
    echo "This isn't a Valid Morrowind folder! Exiting now."
}