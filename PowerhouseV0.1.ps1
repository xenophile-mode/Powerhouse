PowerhouseV0.1.ps1

# Main menu
function Show-Menu
{
     param (
           [string]$Title = 'Powershell Tools'
     )
     cls
	 MenuTitle
    
	 Write-Host "[ A ] List all tools"
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

	 Write-Host "[ I ] Install dependancies"
	 Write-Host "[ H ] Help"
     Write-Host "[ Q ]Quit."
	 Write-Host ""
}

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

#Menu Functions

Function ListAllTools {Show-ListAllToolsMenu}
Function Networking {Show-NetworkingMenu}
Function Printer {Show-PrinterMenu}
Function Disk {Show-DiskMenu}
Function ActiveDirectory {Show-ActiveDirectoryMenu}
Function Updating {Show-UpdatingMenu}
Function Monitoring {Show-MonitoringMenu}
Function Maintanence {Show-MaintanenceMenu}
Function Shortcuts {Show-ShortcutsMenu}
Function BasicPCActions {Show-BasicPCActionsMenu}
Function Device {Show-DeviceMenu}

Function InstallDependancies {Show-InstallDependanciesMenu}
Function Help {Show-HelpMenu}

#Script/Command Functions
Function GetDisk {Get-Disk | Out-Default}
Function GetVolume {Get-Volume ; Get-Disk | Out-Default}
Function UpdateScript {Set-ExecutionPolicy RemoteSigned ; Install-Module PSWindowsUpdate ; Import-Module PSWindowsUpdate}


#List All Tools Menu
function Show-ListAllToolsMenu
{
     param (
           [string]$Title = 'X number of tools'
     )
     cls
	 MenuTitle `
    
     Write-Host "1: Press '1' to run Get-Printer."
     Write-Host "2: Press '2' to run Get-Disk"
     Write-Host "3: Press '3' to run Get-Volume"
     Write-Host "Q: Press 'Q' to quit."
	 Write-Host ""
}

#Networking Menu
function Show-NetworkingMenu
{
     param (
           [string]$Title = 'Networking Tools'
     )
     cls
	 MenuTitle
	 
     Write-Host "1: Press '1' to run Get-Printer."
     Write-Host "2: Press '2' to run Get-Disk"
     Write-Host "3: Press '3' to run Get-Volume"
     Write-Host "Q: Press 'Q' to quit."
	 Write-Host ""
}

#Printer Menu
function Show-PrinterMenu
{
     param (
           [string]$Title = 'Printer Tools'
     )
     cls
	 MenuTitle
	 
     Write-Host "1: Press '1' to run Get-Printer."
     Write-Host "2: Press '2' to run Get-Disk"
     Write-Host "3: Press '3' to run Get-Volume"
     Write-Host "Q: Press 'Q' to quit."
	 Write-Host ""
}

#Disk Menu
function Show-DiskMenu
{
     param (
           [string]$Title = 'Disk Tools'
     )
     cls
	 MenuTitle
	
     Write-Host "1: Press '1' to run Get-Printer."
     Write-Host "2: Press '2' to run Get-Disk"
     Write-Host "3: Press '3' to run Get-Volume"
     Write-Host "Q: Press 'Q' to quit."
	 Write-Host ""
}

#Disk Menu
function Show-ActiveDirectoryMenu
{
     param (
           [string]$Title = 'Active Directory Tools'
     )
     cls
	 MenuTitle
	 
     Write-Host "1: Press '1' to run Get-Printer."
     Write-Host "2: Press '2' to run Get-Disk"
     Write-Host "3: Press '3' to run Get-Volume"
     Write-Host "Q: Press 'Q' to quit."
	 Write-Host ""
}

#Updating Menu
function Show-UpdatingMenu
{
     param (
           [string]$Title = 'Updating Tools'
     )
     cls
	 MenuTitle
	   
     Write-Host "1: Press '1' to run Get-Printer."
     Write-Host "2: Press '2' to run Get-Disk"
     Write-Host "3: Press '3' to run Get-Volume"
     Write-Host "Q: Press 'Q' to quit."
	 Write-Host ""
}

#Monitoring Menu
function Show-MonitoringMenu
{
     param (
           [string]$Title = 'Monitoring Tools'
     )
     cls
	 MenuTitle
	 
     Write-Host "1: Press '1' to run Get-Printer."
     Write-Host "2: Press '2' to run Get-Disk"
     Write-Host "3: Press '3' to run Get-Volume"
     Write-Host "Q: Press 'Q' to quit."
	 Write-Host ""
}

#Maintanence Menu
function Show-MaintanenceMenu
{
     param (
           [string]$Title = 'Maintanence Tools'
     )
     cls
	 MenuTitle
    
     Write-Host "1: Press '1' to run Get-Printer."
     Write-Host "2: Press '2' to run Get-Disk"
     Write-Host "3: Press '3' to run Get-Volume"
     Write-Host "Q: Press 'Q' to quit."
	 Write-Host ""
}

#Shortcuts Menu
function Show-ShortcutsMenu
{
     param (
           [string]$Title = 'Shortcuts'
     )
     cls
	 MenuTitle
    
     Write-Host "1: Press '1' to run Get-Printer."
     Write-Host "2: Press '2' to run Get-Disk"
     Write-Host "3: Press '3' to run Get-Volume"
     Write-Host "Q: Press 'Q' to quit."
	 Write-Host ""
}

#Basic PC Actions Menu
function Show-BasicPCActionsMenu
{
     param (
           [string]$Title = 'Basic PC Actions'
     )
     cls
	 MenuTitle
    
     Write-Host "1: Press '1' to run Get-Printer."
     Write-Host "2: Press '2' to run Get-Disk"
     Write-Host "3: Press '3' to run Get-Volume"
     Write-Host "Q: Press 'Q' to quit."
	 Write-Host ""
}

#Device Menu
function Show-DeviceMenu
{
     param (
           [string]$Title = 'Device Tools'
     )
     cls
	 MenuTitle
    
     Write-Host "1: Press '1' to run Get-Printer."
     Write-Host "2: Press '2' to run Get-Disk"
     Write-Host "3: Press '3' to run Get-Volume"
     Write-Host "Q: Press 'Q' to quit."
	 Write-Host ""
}

#Install Dependancies Menu
function Show-InstallDependanciesMenu
{
     
	 Write-Host 'Create AD user:

  1. From CSV
  2. via Manual input
  q. Quit'


While (($IDSelection = Read-Host -Prompt 'Please select an option') -notin 1,2,'q') 
{ 
    Write-Warning "$Selection is not a valid option" 
}

Switch ($IDSelection) {
    1 { GetVolume }
    2 { New-UserManual }
}
	 
}

#Help Menu
function Show-HelpMenu
{
     param (
           [string]$Title = 'Help Menu'
     )
	 
     cls
	 MenuTitle
    
     Write-Host "1: Press '1' to run Get-Printer."
     Write-Host "2: Press '2' to run Get-Disk"
     Write-Host "3: Press '3' to run Get-Volume"
     Write-Host "Q: Press 'Q' to quit."
	 Write-Host ""
}

#Main menu loop
do
{
     Show-Menu
     $input = Read-Host "Please make a selection"
     switch ($input)
     {
           '1' {
                cls
                Show-NetworkingMenu
           } '2' {
                cls
                Show-PrinterMenu
           } '3' {
                cls
                Show-DiskMenu
           }'4' {
                cls
                Show-ActiveDirectoryMenu
           } '5' {
                cls
                Show-UpdatingMenu
           } '6' {
                cls
                Show-MonitoringMenu
           }'7' {
                cls
                Show-MaintanenceMenu
           } '8' {
                cls
                Show-ShortcutsMenu
           } '9' {
                cls
                Show-BasicPCActionsMenu
           }'10' {
                cls
                Show-DeviceMenu
           } 'A' {
                cls
                Show-ListAllToolsMenu
           } 'I' {
                cls
                Show-InstallDependanciesMenu
           } 'H' {
                cls
                Show-HelpMenu
           } 'q' {
                return
           }
     }
     break
}
until ($input -eq 'q')

