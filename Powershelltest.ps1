#Script/command functions
Function GetVolume {Get-Printer ; Get-Disk | Out-Default}

#Menu Title Functions
Function MenuTitle {
     Write-Host ""	 
	 Write-Host "______                      _ "
	 Write-Host "| ___ \                    | |"      
     Write-Host "| |_/ /____      _____ _ __| |__   ___  _   _ ___  ___ "      
     Write-Host "|  __/ _ \ \ /\ / / _ \ '__| '_ \ / _ \| | | / __|/ _ \"       
     Write-Host "| | | (_) \ V  V /  __/ |  | | | | (_) | |_| \__ \  __/"        
     Write-Host "\_|  \___/ \_/\_/ \___|_|  |_| |_|\___/ \__,_|___/\___|  V0.1"    
     Write-Host ""
	 Write-Host " -Author: Erick Gonzales"
     Write-Host " -Tools: 4"	 
     Write-Host ""
	 Write-Host ""
     Write-Host ""
	 
     Write-Host "====================== $Title ======================"
     Write-Host ""
}


#Test submenu
function OtherMenu
{
     param (
           [string]$Title = 'Other Menu'
     )
	 MenuTitle
	 Write-Host '
  [ 1 ] Get Volume
  [ 2 ] Test
  [ 3 ] Main Menu
  
  [ q ] Quit
  '


While (($IDSelection = Read-Host -Prompt 'Please select an option') -notin 1,2,3,'q') 
{ 
    Write-Warning "$Selection is not a valid option" 
}

Switch ($IDSelection) {
    1 { cls ; GetVolume }
    2 { cls ; echo test }
	3 { cls ; Show-MainMenu }
	
	'q' { exit }
}
	 OtherMenu
}


function Show-MainMenu
{
     param (
           [string]$Title = 'Main Menu'
     )
	 MenuTitle
	 Write-Host '
  [ 1 ] GetVolume
  [ 2 ] Other Menu
  
  [ q ] Quit
  '


While (($IDSelection = Read-Host -Prompt 'Please select an option') -notin 1,2,'q') 
{ 
    Write-Warning "$Selection is not a valid option" 
}

Switch ($IDSelection) {
    1 { GetVolume }
    2 { cls ; OtherMenu }
    'q' { exit }
}
	 Show-MainMenu
}


cls ; Show-MainMenu