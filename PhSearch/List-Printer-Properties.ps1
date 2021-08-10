Function PrinterPropterty {$printcf = read-host "Specify printer" ; Get-PrinterProperty -PrinterName ($printcf) | Out-Default}
PrinterProperty
