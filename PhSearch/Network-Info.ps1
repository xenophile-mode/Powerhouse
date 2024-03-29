Function NetStatScript { 
    echo ***YOUR-HOSTNAME*** ; hostname ; Write-Host "" ; ` 
	echo ***NetworkAdapterStats*** ; Get-NetAdapterStatistics ; `
	Write-Host "" ; echo ***MACAddresses*** ; getmac /v ; ` 
	Write-Host "" ; echo ***IPConfiguration*** ; ` 
	ipconfig | Out-Default ; Write-Host "" ; echo ***PingingGoogle.com*** ; `
	ping google.com ; Write-Host "" ; echo ***NetworkStatistics*** ; ` 
	netstat -e ; Write-Host "" ; echo ***Printers*** ; `
	Get-Printer | Out-Default ; Write-Host "" ; echo ***RunningSpeedtest*** ; `
	speedtest | Out-Default 
} 
NetStatScript 