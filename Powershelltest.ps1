#Script/command functions
Function GetVolume {Get-Printer | Out-Default ; Get-Disk | Out-Default}

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
	 Get-Date
	 Write-Host ""
	 $env:computername 
     Write-Host ""
	 
     Write-Host "====================== $Title ======================"
     Write-Host ""
}


#Test submenu
function ListToolsMenu
{
     param (
           [string]$Title = 'All tools'
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
	 ListToolsMenu
}


function Show-MainMenu
{
     param (
           [string]$Title = 'Main Menu'
     )
	 MenuTitle
	 Write-Host "[ a ] List all tools"
     Write-Host "[ 1 ] Networking tools"
     Write-Host "[ 2 ] Printer tools"
     Write-Host "[ 3 ] Disk tools"
	 Write-Host "[ 4 ] Active Directory tools"
	 Write-Host "[ 5 ] Updating tools"
	 Write-Host "[ 6 ] Monitoring tools"
	 Write-Host "[ 7 ] Maintanence scripts"
	 Write-Host "[ 8 ] Shortcuts"
	 Write-Host "[ 9 ] Basic PC actions"
	 Write-Host "[ 10 ] Device tools"
	 Write-Host ""

	 Write-Host "[ i ] Install dependancies"
	 Write-Host "[ h ] Help"
     Write-Host "[ q ]Quit."
	 Write-Host ""


While (($IDSelection = Read-Host -Prompt 'Please select an option') -notin 'a',1,2,'q') 
{ 
    Write-Warning "$Selection is not a valid option" 
}

Switch ($IDSelection) {
    'a' {cls ; ListToolsMenu}
	1 { GetVolume }
    2 { cls ; OtherMenu }
    'q' { exit }
}
	 Show-MainMenu
}


cls ; Show-MainMenu