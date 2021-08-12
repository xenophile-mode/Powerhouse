Function Devices {
	Get-CIMInstance Win32_PnPSignedDriver | select devicename,driverversion | `
	Out-Default
}
Devices
