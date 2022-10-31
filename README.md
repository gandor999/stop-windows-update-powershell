#### Stop Windows Update

This is a powershell script to stop windows update and delete the 'Download' directory under the 'Software Distribution' dir.

To make an executable, download powershell module 'ps2exe'

In powershell, execute the commands:

`Install-Module ps2exe`

`Y`

`Invoke-ps2exe <path of .ps1 file> <path for .exe file>`