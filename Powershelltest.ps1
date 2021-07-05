Function GetVolume {Get-Printer ; Get-Disk | Out-Default}


function OtherMenu
{
     
	 Write-Host 'Other Menu:

  1. Get Volume
  2. Test
  3. Main Menu
  q. Quit'


While (($IDSelection = Read-Host -Prompt 'Please select an option') -notin 1,2,3,'q') 
{ 
    Write-Warning "$Selection is not a valid option" 
}

Switch ($IDSelection) {
    1 { GetVolume }
    2 { echo test }
	3 { cls ; Show-MainMenu }
}
	 OtherMenu
}


function Show-MainMenu
{
     
	 Write-Host 'Main Menu:

  1. GetVolume
  2. Other Menu
  q. Quit'


While (($IDSelection = Read-Host -Prompt 'Please select an option') -notin 1,2,'q') 
{ 
    Write-Warning "$Selection is not a valid option" 
}

Switch ($IDSelection) {
    1 { GetVolume }
    2 { cls ; OtherMenu }
}
	 Show-MainMenu
}


cls ; Show-MainMenu