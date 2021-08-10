Function PrintConfig {$printcf = read-host "Specify printer" ; Get-PrintConfiguration -PrinterName ($printcf) | Out-Default}
PrintConfig 
