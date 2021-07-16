Function PrintJob {$printcf = read-host "Specify printer" ; Get-PrintJob -PrinterName ($printcf) | Out-Default}
PrintJob ; pause ; cd C:\Users\Administrator\Powerhouse ; ./Powerhouse.ps1
