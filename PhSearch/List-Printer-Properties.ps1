Function PrinterPropterty {$printcf = read-host "Specify printer" ; Get-PrinterProperty -PrinterName ($printcf) | Out-Default}
PrinterProperty ; pause ; cd C:\Users\Administrator\Powerhouse ; ./Powerhouse.ps1
