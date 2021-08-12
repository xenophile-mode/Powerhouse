Function InstallWU {
	Install-WindowsUpdate -AcceptAll -AutoReboot | Out-Default
}
InstallWU
