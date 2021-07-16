Function WarnEvents {Get-WinEvent -MaxEvents 20 -FilterHashTable @{LogName='System';Level='3'} | Format-List}
WarnEvents ; pause ; cd C:\Users\Administrator\Powerhouse ; ./Powerhouse.ps1
