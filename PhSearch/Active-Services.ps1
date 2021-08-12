Function ActiveServices {
	Get-Service | Where-Object {
		$_.Status -eq "Running"
		} | Out-Default
}
ActiveServices 