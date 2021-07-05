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
	 Write-Host "Hostname:$($env:computername)                 $(Get-Date)" 
     Write-Host ""
	 
     Write-Host "====================== $Title ======================"
     Write-Host ""
}


#Test submenu
function ListToolsMenu
{
     param (
           [string]$Title = 'Networking tools'
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
	 Write-Host "[ m ] Main Menu"

	 
	 Write-Host ""

	 Write-Host "[ i ] Install dependancies"
	 Write-Host "[ h ] Help"
     Write-Host "[ q ] Quit"
	 Write-Host ""

While (($IDSelection = Read-Host -Prompt 'Please select an option') -notin 1,2,3,'m','q') 
{ 
    Write-Warning "$Selection is not a valid option" 
}

Switch ($IDSelection) {
	'm' { cls ; MainMenu }
    1 { cls ; GetVolume }
    2 { cls ; echo test }
	3 { cls ; Show-MainMenu }
	
	'q' { exit }
}
	 ListToolsMenu
}


function NetworkingMenu
{
     param (
           [string]$Title = 'Networking tools'
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
	 Write-Host "[ m ] Main Menu"

	 
	 Write-Host ""

	 Write-Host "[ i ] Install dependancies"
	 Write-Host "[ h ] Help"
     Write-Host "[ q ] Quit"
	 Write-Host ""

While (($IDSelection = Read-Host -Prompt 'Please select an option') -notin 1,2,3,'m','q') 
{ 
    Write-Warning "$Selection is not a valid option" 
}

Switch ($IDSelection) {
	'm' { cls ; MainMenu }
    1 { cls ; GetVolume }
    2 { cls ; echo test }
	3 { cls ; Show-MainMenu }
	
	'q' { exit }
}
	 NetworkingMenu
}

function PrinterMenu
{
     param (
           [string]$Title = 'Printer tools'
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
	 Write-Host "[ m ] Main Menu"

	 
	 Write-Host ""

	 Write-Host "[ i ] Install dependancies"
	 Write-Host "[ h ] Help"
     Write-Host "[ q ] Quit"
	 Write-Host ""

While (($IDSelection = Read-Host -Prompt 'Please select an option') -notin 1,2,3,'m','q') 
{ 
    Write-Warning "$Selection is not a valid option" 
}

Switch ($IDSelection) {
	'm' { cls ; MainMenu }
    1 { cls ; GetVolume }
    2 { cls ; echo test }
	3 { cls ; Show-MainMenu }
	
	'q' { exit }
}
	 PrinterMenu
}

function DiskMenu
{
     param (
           [string]$Title = 'Disk Tools'
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
	 Write-Host "[ m ] Main Menu"

	 
	 Write-Host ""

	 Write-Host "[ i ] Install dependancies"
	 Write-Host "[ h ] Help"
     Write-Host "[ q ] Quit"
	 Write-Host ""

While (($IDSelection = Read-Host -Prompt 'Please select an option') -notin 1,2,3,'m','q') 
{ 
    Write-Warning "$Selection is not a valid option" 
}

Switch ($IDSelection) {
	'm' { cls ; MainMenu }
    1 { cls ; GetVolume }
    2 { cls ; echo test }
	3 { cls ; Show-MainMenu }
	
	'q' { exit }
}
	 DiskMenu
}

function ActiveDirectoryMenu
{
     param (
           [string]$Title = 'Active Directory tools'
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
	 Write-Host "[ m ] Main Menu"

	 
	 Write-Host ""

	 Write-Host "[ i ] Install dependancies"
	 Write-Host "[ h ] Help"
     Write-Host "[ q ] Quit"
	 Write-Host ""

While (($IDSelection = Read-Host -Prompt 'Please select an option') -notin 1,2,3,'m','q') 
{ 
    Write-Warning "$Selection is not a valid option" 
}

Switch ($IDSelection) {
	'm' { cls ; MainMenu }
    1 { cls ; GetVolume }
    2 { cls ; echo test }
	3 { cls ; Show-MainMenu }
	
	'q' { exit }
}
	 ActiveDirectoryMenu
}

function UpdatingMenu
{
     param (
           [string]$Title = 'Updating tools'
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
	 Write-Host "[ m ] Main Menu"

	 
	 Write-Host ""

	 Write-Host "[ i ] Install dependancies"
	 Write-Host "[ h ] Help"
     Write-Host "[ q ] Quit"
	 Write-Host ""

While (($IDSelection = Read-Host -Prompt 'Please select an option') -notin 1,2,3,'m','q') 
{ 
    Write-Warning "$Selection is not a valid option" 
}

Switch ($IDSelection) {
	'm' { cls ; MainMenu }
    1 { cls ; GetVolume }
    2 { cls ; echo test }
	3 { cls ; Show-MainMenu }
	
	'q' { exit }
}
	 UpdatingMenu
}

function MonitoringMenu
{
     param (
           [string]$Title = 'Monitoring tools'
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
	 Write-Host "[ m ] Main Menu"

	 
	 Write-Host ""

	 Write-Host "[ i ] Install dependancies"
	 Write-Host "[ h ] Help"
     Write-Host "[ q ] Quit"
	 Write-Host ""

While (($IDSelection = Read-Host -Prompt 'Please select an option') -notin 1,2,3,'m','q') 
{ 
    Write-Warning "$Selection is not a valid option" 
}

Switch ($IDSelection) {
	'm' { cls ; MainMenu }
    1 { cls ; GetVolume }
    2 { cls ; echo test }
	3 { cls ; Show-MainMenu }
	
	'q' { exit }
}
	 MonitoringMenu
}

function MaintanenceMenu
{
     param (
           [string]$Title = 'Maintanence tools'
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
	 Write-Host "[ m ] Main Menu"

	 
	 Write-Host ""

	 Write-Host "[ i ] Install dependancies"
	 Write-Host "[ h ] Help"
     Write-Host "[ q ] Quit"
	 Write-Host ""

While (($IDSelection = Read-Host -Prompt 'Please select an option') -notin 1,2,3,'m','q') 
{ 
    Write-Warning "$Selection is not a valid option" 
}

Switch ($IDSelection) {
	'm' { cls ; MainMenu }
    1 { cls ; GetVolume }
    2 { cls ; echo test }
	3 { cls ; Show-MainMenu }
	
	'q' { exit }
}
	 MaintanenceMenu
}

function ShortcutsMenu
{
     param (
           [string]$Title = 'Shortcuts Menu'
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
	 Write-Host "[ m ] Main Menu"

	 
	 Write-Host ""

	 Write-Host "[ i ] Install dependancies"
	 Write-Host "[ h ] Help"
     Write-Host "[ q ] Quit"
	 Write-Host ""

While (($IDSelection = Read-Host -Prompt 'Please select an option') -notin 1,2,3,'m','q') 
{ 
    Write-Warning "$Selection is not a valid option" 
}

Switch ($IDSelection) {
	'm' { cls ; MainMenu }
    1 { cls ; GetVolume }
    2 { cls ; echo test }
	3 { cls ; Show-MainMenu }
	
	'q' { exit }
}
	 ShortcutsMenu
}

function BasicActionsMenu
{
     param (
           [string]$Title = 'Basic PC tools'
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
	 Write-Host "[ m ] Main Menu"

	 
	 Write-Host ""

	 Write-Host "[ i ] Install dependancies"
	 Write-Host "[ h ] Help"
     Write-Host "[ q ] Quit"
	 Write-Host ""

While (($IDSelection = Read-Host -Prompt 'Please select an option') -notin 1,2,3,'m','q') 
{ 
    Write-Warning "$Selection is not a valid option" 
}

Switch ($IDSelection) {
	'm' { cls ; MainMenu }
    1 { cls ; GetVolume }
    2 { cls ; echo test }
	3 { cls ; Show-MainMenu }
	
	'q' { exit }
}
	 BasicActionsMenu
}

function DeviceMenu
{
     param (
           [string]$Title = 'Device tools'
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
	 Write-Host "[ m ] Main Menu"

	 
	 Write-Host ""

	 Write-Host "[ i ] Install dependancies"
	 Write-Host "[ h ] Help"
     Write-Host "[ q ] Quit"
	 Write-Host ""

While (($IDSelection = Read-Host -Prompt 'Please select an option') -notin 1,2,3,'m','q') 
{ 
    Write-Warning "$Selection is not a valid option" 
}

Switch ($IDSelection) {
	'm' { cls ; MainMenu }
    1 { cls ; GetVolume }
    2 { cls ; echo test }
	3 { cls ; Show-MainMenu }
	
	'q' { exit }
}
	 DeviceMenu
}

function InstallMenu
{
     param (
           [string]$Title = 'Install Dependancies'
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
	 Write-Host "[ m ] Main Menu"

	 
	 Write-Host ""

	 Write-Host "[ i ] Install dependancies"
	 Write-Host "[ h ] Help"
     Write-Host "[ q ] Quit"
	 Write-Host ""

While (($IDSelection = Read-Host -Prompt 'Please select an option') -notin 1,2,3,'m','q') 
{ 
    Write-Warning "$Selection is not a valid option" 
}

Switch ($IDSelection) {
	'm' { cls ; MainMenu }
    1 { cls ; GetVolume }
    2 { cls ; echo test }
	3 { cls ; Show-MainMenu }
	
	'q' { exit }
}
	 InstallMenu
}

function HelpMenu
{
     param (
           [string]$Title = 'Help Menu'
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
	 Write-Host "[ m ] Main Menu"

	 
	 Write-Host ""

	 Write-Host "[ i ] Install dependancies"
	 Write-Host "[ h ] Help"
     Write-Host "[ q ] Quit"
	 Write-Host ""

While (($IDSelection = Read-Host -Prompt 'Please select an option') -notin 1,2,3,'m','q') 
{ 
    Write-Warning "$Selection is not a valid option" 
}

Switch ($IDSelection) {
	'm' { cls ; MainMenu }
    1 { cls ; GetVolume }
    2 { cls ; echo test }
	3 { cls ; Show-MainMenu }
	
	'q' { exit }
}
	 HelpMenu
}

function MainMenu
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
     Write-Host "[ q ] Quit"
	 Write-Host ""


While (($IDSelection = Read-Host -Prompt 'Please select an option') -notin 'a',1,2,3,4,5,6,7,8,9,10,'h','q','i') 
{ 
    Write-Warning "$Selection is not a valid option" 
}

Switch ($IDSelection) {
    'a' {cls ; ListToolsMenu}
	1 { cls ; NetworkingMenu }
    2 { cls ; PrinterMenu }
	3 { cls ; DiskMenu }
	4 { cls ; ActiveDirectoryMenu }
    5 { cls ; UpdatingMenu }
    6 { cls ; MonitoringMenu }
    7 { cls ; MaintanenceMenu }
    8 { cls ; ShortcutsMenu }
    9 { cls ; BasicActionsMenu }
    10 { cls ; DeviceMenu }

    'i' { cls ; InstallMenu }
    'h'	{ cls ; HelpMenu }
	'q' { exit }
}
	 MainMenu
}


cls ; MainMenu