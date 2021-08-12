Function dhcpf {
	Get-CimInstance -Class Win32_NetworkAdapterConfiguration -Filter "DHCPEnabled=$true" | `
	Format-Table -Property DHCP* | Out-Default
}
dhcpf