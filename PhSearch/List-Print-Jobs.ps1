Function PrintJob {
	$printcf = read-host "Specify printer" ; `
	Get-PrintJob -PrinterName ($printcf) | Out-Default
}
PrintJob
