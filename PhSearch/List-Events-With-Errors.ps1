Function EventErrors {Get-WinEvent -FilterHashTable @{LogName='System';Level='2'} | Format-List}
EventErrors 