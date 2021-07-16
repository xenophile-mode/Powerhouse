Function EventErrors {Get-WinEvent -FilterHashTable @{LogName='System';Level='2'} | Format-List}
EventErrors ; pause ; cd C:\Users\Administrator\Powerhouse ; ./Powerhouse.ps1
