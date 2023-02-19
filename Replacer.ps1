Function Get-Folder($initialDirectory=""){
    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms")|Out-Null

    $foldername = New-Object System.Windows.Forms.FolderBrowserDialog
    $foldername.Description = "Select a folder"
    $foldername.rootfolder = "MyComputer"
    $foldername.SelectedPath = $initialDirectory

    if($foldername.ShowDialog((New-Object System.Windows.Forms.Form -Property @{TopMost = $true })) -eq "OK"){
        $folder += $foldername.SelectedPath
    }
    return $folder
}

Function Get-File($initialDirectory=""){
    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms")|Out-Null

    $filename = New-Object System.Windows.Forms.OpenFileDialog
    $filename.Title = "Choose File"

    if($filename.ShowDialog((New-Object System.Windows.Forms.Form -Property @{TopMost = $true })) -eq "OK"){
        $file += $filename.FileName
    }
    return $file
}

echo "Please Select the Morrowind installation Folder(This is the folder that contains the Morrowind.exe file)"

$mwfolder = Get-Folder


If(Test-Path -Path $mwfolder\Morrowind.exe -PathType Leaf){
    
    #Select input mp3
    echo "Please Choose an mp3 file"
    $inmp3 = Get-File("","Choose .mp3 File")
    If(!($inmp3.Contains(".mp3"))){
        [System.Windows.MessageBox]::Show("Not a valid mp3 file! Exiting now.", "Error", 0, "Error")
        Exit 2
    }

    #Select input wav
    echo "Please Choose a wav file"
    $inwav = Get-File("","Choose .wav File")
    If(!($inwav.Contains(".wav"))){
        [System.Windows.MessageBox]::Show("Not a valid mp3 file! Exiting now.", "Error", 0, "Error")
        Exit 3
    }

    #Backup?
    $backupindicator = [System.Windows.MessageBox]::Show("Do you want to take a backup of the original sounds? This is highly recommended", "Backup", 4, "Question")
    If($backupindicator -eq "Yes"){
        echo "Please be patient, this could take a few minutes >_<"
        Copy-Item -Path "$mwfolder\Data Files\Sound\*" -Destination ".\backup" -Recurse
    }

    #Copy/OverWrite
    echo "Generating list of files to overwrite"
    $mp3list = Get-ChildItem -Path "$mwfolder\Data Files\Sound" -Filter *.mp3 -Recurse | Select -ExpandProperty FullName
    $wavlist = Get-ChildItem -Path "$mwfolder\Data Files\Sound" -Filter *.wav -Recurse | Select -ExpandProperty FullName
    
    echo "OverWriting mp3's, this could take a while -_-"
    Foreach ($mp3path in $mp3list){
        Copy-Item -Path $inmp3 -Destination $mp3path -Force
    }
    
    echo "OverWriting wav's, this shouldn't take as long :3"
    Foreach ($wavpath in $wavlist){
        Copy-Item -Path $inwav -Destination $wavpath -Force
    }

    echo "Copy complete, enjoy your modded Morowind!"

} Else {
    [System.Windows.MessageBox]::Show("This isn't a Valid Morrowind folder! Exiting now.", "Error", 0, "Error")
    Exit 1
}