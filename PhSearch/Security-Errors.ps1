Function SecEvents {
	Get-WinEvent -LogName 'Security' -MaxEvents 20 | Format-List
} 
SecEvents
