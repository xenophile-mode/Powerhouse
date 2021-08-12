Function GetVersion {
	Get-ComputerInfo -Property "*version" | Out-Default
} 
GetVersion