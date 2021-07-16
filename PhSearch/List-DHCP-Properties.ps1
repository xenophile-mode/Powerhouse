Function dhcpf {Get-CimInstance -Class Win32_NetworkAdapterConfiguration -Filter "DHCPEnabled=$true" | Format-Table -Property DHCP* | Out-Default}
dhcpf ; pause ; cd C:\Users\Administrator\Powerhouse ; ./Powerhouse.ps1
