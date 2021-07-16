Function PrintConfig {$printcf = read-host "Specify printer" ; Get-PrintConfiguration -PrinterName ($printcf) | Out-Default}
PrintConfig ; pause ; cd C:\Users\Administrator\Powerhouse ; ./Powerhouse.ps1
