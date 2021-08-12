Function RecentEvents {
	Get-WinEvent -LogName 'System' -MaxEvents 20 | Format-List
}
RecentEvents 