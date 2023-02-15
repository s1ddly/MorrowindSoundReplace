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

Function Get-File($initialDirectory="")

{
    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms")|Out-Null

    $filename = New-Object System.Windows.Forms.OpenFileDialog

    if($filename.ShowDialog((New-Object System.Windows.Forms.Form -Property @{TopMost = $true })) -eq "OK")
    {
        $file += $filename.FileName
    }
    return $file
}

$mwfolder = Get-Folder

echo "$mwfolder\Data Files\Sound"

If(Test-Path -Path $mwfolder\Morrowind.exe -PathType Leaf){
    #Select input mp3
    $inmp3 = Get-File
    echo $inmp3
    #Select input wav

    #Backup?

    #Copy/OverWrite
    echo "Generating list of files to overwrite"
    $mp3list = Get-ChildItem -Path "$mwfolder\Data Files\Sound" -Filter *.mp3 -Recurse
    $wavlist = Get-ChildItem -Path "$mwfolder\Data Files\Sound" -Filter *.wav -Recurse
    echo "OverWriting mp3's"
} Else {
    [System.Windows.MessageBox]::Show("This isn't a Valid Morrowind folder! Exiting now.", "Error", 0, "Error")
}