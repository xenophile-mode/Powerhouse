Function Process40mb {Get-Process | Where-Object {$_.WorkingSet -gt 40000000} | Out-Default}
Process40mb ; pause ; cd C:\Users\Administrator\Powerhouse ; ./Powerhouse.ps1
