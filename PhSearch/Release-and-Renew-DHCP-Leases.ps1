Function dhcpr {
	Get-CimInstance -Class Win32_NetworkAdapterConfiguration -Filter `
	"IPEnabled=$true and DHCPEnabled=$true" | Where-Object {
		$_.DHCPServer -contains '192.168.1.254'
	    } | ForEach-Object -Process {$_.ReleaseDHCPLease()} ; `
		Write-Host "***DHCP Leases released and renewed***" | Out-Default 
}
dhcpr