Function FlushRegister {ipconfig /flushdns ; ipconfig /registerdns ; Write-Host "***DNS Flushed and Registered***" ; ipconfig /displaydns | Out-Default}
FlushRegister ; pause ; cd C:\Users\Administrator\Powerhouse ; ./Powerhouse.ps1
