Function UpdateWUCache {
	Get-Service -Name wuauserv,bits,cryptsvc | Stop-Service ; Remove-Item -Path `
	"$env:ALLUSERSPROFILE\Application Data\Microsoft\Network\Downloader\qmgr*.dat" ; `
	Get-Service -Name wuauserv,bits,cryptsvc | Start-Service ; `
	Write-Host "***Windows Update Cache Updated***" | Out-Default }
UpdateWUCache 
