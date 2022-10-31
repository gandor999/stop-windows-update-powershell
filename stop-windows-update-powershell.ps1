function get_software_distribution_download_path {
    param ($pshome_path_array)

    $windows_path = ""

    foreach ($path in $pshome_path_array){
        $windows_path += "$path\"

        if($path -eq "Windows"){
            break
        }
    }

    return $windows_path + "SoftwareDistribution\Download"
}

$download_dir_path_absolute = get_software_distribution_download_path $PSHOME.Split("\")

Write-Output "`n--- Start ---`n"

sc.exe stop wuauserv

sc.exe config wuauserv start= disabled

try {
    Remove-Item $download_dir_path_absolute -Recurse -Force -Confirm:$false -ErrorAction Stop
    Write-Output "File deleted"
}
catch {
    Write-Output "Unable to delete file. File does not exist"
}

Write-Output "`n--- End ---`n"

Write-Output "Press any key to exit"

cmd /c 'pause'

