Function InstallOWU {
	Install-WindowsUpdate -criteria ` 
	"isinstalled=0 and deploymentaction=*" -AutoReboot | Out-Default 
}
InstallOWU 
