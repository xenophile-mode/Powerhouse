Function InstallOWU {Install-WindowsUpdate -criteria "isinstalled=0 and deploymentaction=*" -AutoReboot | Out-Default }
InstallOWU ; pause ; cd C:\Users\Administrator\Powerhouse ; ./Powerhouse.ps1
