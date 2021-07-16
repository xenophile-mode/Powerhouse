Function InstallWUGP { gpupdate /force ; Install-WindowsUpdate -AcceptAll -Autoreboot | Out-Default}
InstallWUGP ; pause ; cd C:\Users\Administrator\Powerhouse ; ./Powerhouse.ps1
