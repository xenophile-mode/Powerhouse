Function AddSc {
	$script = read-host "Enter your script" ; $callf = read-host `
    "Call Function" ; $scriptn = read-host "Enter script name" ; `
	Add-Content -Path ('C:\Users\Administrator\Powerhouse\PhSearch\' + $scriptn ) -Value `
	$script ; Add-Content -Path ('C:\Users\Administrator\Powerhouse\PhSearch\' + $scriptn ) -Value `
	( $callf + ' ; pause ; cd C:\Users\Administrator\Powerhouse ; ./Powerhouse.ps1') ; ` 
	Write-Host "***Script added***" 
}
AddSc
