Function ActiveServices {Get-Service | Where-Object {$_.Status -eq "Running"} | Out-Default}
ActiveServices ; pause ; cd C:\Users\Administrator\Powerhouse ; ./Powerhouse.ps1
