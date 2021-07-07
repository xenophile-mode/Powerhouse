#Script/command functions
Function UpdateDP {Set-ExecutionPolicy RemoteSigned ; Install-Module PSWindowsUpdate ; Import-Module PSWindowsUpdate | Out-Default }
Function InstallWU { Install-WindowsUpdate -AcceptAll -AutoReboot | Out-Default }
Function CheckOUD {get-wulist -criteria "isinstalled=0 and deploymentaction=*" | Out-Default}
Function CheckUD {get-wulist | Out-Default}
Function InstallOWU {Install-WindowsUpdate -criteria "isinstalled=0 and deploymentaction=*" -AutoReboot | Out-Default }
Function Clean {cleanmgr ; echo ***Running Cleanmgr***}
Function Alias { New-Alias }
Function TestPrinter { Out-Printer }
Function Tree {tree} 
Function UpdateWUCache { Get-Service -Name wuauserv,bits,cryptsvc | Stop-Service ; Remove-Item -Path "$env:ALLUSERSPROFILE\Application Data\Microsoft\Network\Downloader\qmgr*.dat" ; Get-Service -Name wuauserv,bits,cryptsvc | Start-Service ; Write-Host "***Windows Update Cache Updated***" | Out-Default }
Function InstallWUGP { gpupdate /force ; Install-WindowsUpdate -AcceptAll -Autoreboot }
Function CleanupScript { Clear-RecycleBin ; Clear-BCCache ; Remove-Item -Path $env:TEMP -Recurse -Force -ErrorAction SilentlyContinue }
Function NetStatScript { echo ***YOUR-HOSTNAME*** ; hostname ; echo ***NetworkAdapterStats*** ; Get-NetAdapterStatistics ; echo ***MACAddresses*** ; getmac /v ; echo ***IPConfiguration*** ; ipconfig ; echo ***PingingGoogle.com*** ; ping google.com ; echo ***NetworkStatistics*** ; netstat -e ; echo ***Printers*** ; Get-Printer | Out-Default ; echo ***RunningSpeedtest*** ; C:\Users\Administrator\Downloads\ookla-speedtest-1.0.0-win64\speedtest | Out-Default } 
Function DiskStatScript { Get-Disk ; Get-Partition ; Get-PhysicalDiskStorageNodeView | Out-Default}
Function Chkdsk {chkdsk /scan}
Function Process40mb {Get-Process | Where-Object {$_.WorkingSet -gt 40000000}}
Function SecurityScript {Update-MpSignature ; echo ***UPDATED-ANTIMALWARE-DEFINITIONS*** ; Start-MpScan -ScanType QuickScan ; echo ***SCAN-COMPLETED*** ; Get-MpComputerStatus ; Get-MpThreat ; Get-MpThreatDetection}
Function BiosInfo {Get-WmiObject -Class Win32_Bios | Format-List -Property *}
Function ActiveServices {Get-Service | Where-Object {$_.Status -eq "Running"}}
Function RecentEvents {Get-EventLog -LogName System -Newest 30}
Function DomainStat {Get-ADDomain}
Function ADUsers {Get-ADUser -Filter *}
Function SearchUsers {get-Aduser -Filter {name -like "*robert*"}}
Function LockedUsers {Search-ADAccount -LockedOut}
Function DisabledUsers {Search-ADAccount -AccountDisabled}
Function UnlockAccount {Unlock-ADAccount -Identity PattiFu}
Function PwChange {Set-ADAccountPassword -Identity elisada -OldPassword (ConvertTo-SecureString -AsPlainText "p@ssw0rd" -Force) -NewPassword (ConvertTo-SecureString -AsPlainText "qwert@12345" -Force) ; Set-ADUser -Identity username -ChangePasswordAtLogon $true }
Function ntop {ntop}
Function SpeedTest {C:\Users\Administrator\Downloads\ookla-speedtest-1.0.0-win64\speedtest | Out-Default}
Function IpConfig {ipconfig | Out-Default}
Function GetDisk {Get-Disk}
Function MAC {getmac /v}
Function PrinterStats {Get-Printer ; Get-PrintConfiguration ; Get-PrinterDriver ; Get-PrinterPort ; Get-PrintJob ; Get-PrinterProperty | Out-Default}
Function Printer {Get-Printer | Out-Default}
Function PrinterDriver {Get-PrinterDriver | Out-Default}
Function PrintConfig {Get-PrintConfiguration | Out-Default}
Function PrinterPort {Get-PrinterPort | Out-Default}
Function PrintJob {Get-PrintJob | Out-Default}
Function PrinterPropterty {Get-PrinterProperty | Out-Default}
Function Devices {gwmi Win32_PnPSignedDriver | select devicename,driverversion ; gwmi Win32_SystemDriver | select name,@{n="version";e={(gi $_.pathname).VersionInfo.FileVersion}} | Out-Default}
Function GpudateRB {gpupdate /force /boot}









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
	 Write-Host "Author: Erick Gonzales                         Tools:4"
     Write-Host ""
	 whoami ; Get-Date	 
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
     Write-Host "[ 1 ] List Windows Updates"
     Write-Host "[ 2 ] List Optional Updates"
     Write-Host "[ 3 ] Install Windows Updates"
	 Write-Host "[ 4 ] Insatll Optional Windows Updates"
	 Write-Host "[ 5 ] Updated Windows Update Cache"
	 Write-Host "[ 6 ] Group Policy Update and Windows Update"
	 Write-Host "[ 7 ] Group Policy Update with auto reboot"
	 
	 Write-Host ""

	 Write-Host "[ i ] Install dependancies"
	 Write-Host "[ h ] Help"
     Write-Host "[ q ] Quit"
	 Write-Host ""

While (($IDSelection = Read-Host -Prompt 'Please select an option') -notin 1,2,3,4,5,6,7,'m','q') 
{ 
    Write-Warning "$Selection is not a valid option" 
}

Switch ($IDSelection) {
	'm' { cls ; MainMenu }
    1 { cls ; CheckUD }
    2 { cls ; CheckOUD }
	3 { cls ; InstallWU	}
	4 { cls ; InstallOWU}
	5 { cls ; UpdateWUCache}
	6 { cls ; InstallWUGP}
	7 { cls ; GpudateRB}


	'q' { exit }
}
	 pause ; cls ; UpdatingMenu
}

function Stats/MonitoringMenu
{
     param (
           [string]$Title = 'Stats/Monitoring tools'
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
	 Write-Host "[ 1 ] Install Windows Update Dependancies"
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
    1 { cls ; UpdateDP | Out-Default }
    2 { cls ; echo test }
	3 { cls ; Show-MainMenu }
	
	'q' { exit }
}
	 pause ; cls ; InstallMenu
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
    6 { cls ; Stats/MonitoringMenu }
    7 { cls ; MaintanenceMenu }
    8 { cls ; ShortcutsMenu }
    9 { cls ; BasicActionsMenu }
    10 { cls ; DeviceMenu }

    'i' { cls ; InstallMenu }
    'h'	{ cls ; HelpMenu }
	'q' { exit }
}
	 cls ; MainMenu
}


cls ; MainMenu