#Script/command functions
Function UpdateDP {Set-ExecutionPolicy RemoteSigned ; Install-Module PSWindowsUpdate ; Import-Module PSWindowsUpdate | Out-Default }
Function InstallWU {Install-WindowsUpdate -AcceptAll -AutoReboot | Out-Default}
Function CheckOUD {get-wulist -criteria "isinstalled=0 and deploymentaction=*" | Out-Default}
Function CheckUD {get-wulist | Out-Default}
Function InstallOWU {Install-WindowsUpdate -criteria "isinstalled=0 and deploymentaction=*" -AutoReboot | Out-Default }
Function Clean {cleanmgr ; echo ***Running Cleanmgr***}
Function Alias { New-Alias }
Function TestPrinter { Out-Printer }
Function UpdateWUCache { Get-Service -Name wuauserv,bits,cryptsvc | Stop-Service ; Remove-Item -Path "$env:ALLUSERSPROFILE\Application Data\Microsoft\Network\Downloader\qmgr*.dat" ; Get-Service -Name wuauserv,bits,cryptsvc | Start-Service ; Write-Host "***Windows Update Cache Updated***" | Out-Default }
Function InstallWUGP { gpupdate /force ; Install-WindowsUpdate -AcceptAll -Autoreboot }
Function CleanupScript { Clear-RecycleBin ; Clear-BCCache ; Remove-Item -Path $env:TEMP -Recurse -Force -ErrorAction SilentlyContinue }
Function NetStatScript { echo ***YOUR-HOSTNAME*** ; hostname ; echo ***NetworkAdapterStats*** ; Get-NetAdapterStatistics ; echo ***MACAddresses*** ; getmac /v ; echo ***IPConfiguration*** ; ipconfig | Out-Default ; echo ***PingingGoogle.com*** ; ping google.com ; echo ***NetworkStatistics*** ; netstat -e ; echo ***Printers*** ; Get-Printer | Out-Default ; echo ***RunningSpeedtest*** ; C:\Users\Administrator\Downloads\ookla-speedtest-1.0.0-win64\speedtest | Out-Default } 
Function DiskStatScript { Get-Disk | Out-Default ; Get-Partition | Out-Default ; Get-PhysicalDiskStorageNodeView | Out-Default}
Function Chkdsk {chkdsk /scan}
Function Process40mb {Get-Process | Where-Object {$_.WorkingSet -gt 40000000} | Out-Default}
Function SecurityScript {Update-MpSignature ; echo ***UPDATED-ANTIMALWARE-DEFINITIONS*** ; Start-MpScan -ScanType QuickScan ; echo ***SCAN-COMPLETED*** ; Get-MpComputerStatus ; Get-MpThreat ; Get-MpThreatDetection}
Function BiosInfo {Get-CIMInstance -Class Win32_Bios | Format-List -Property *}
Function ActiveServices {Get-Service | Where-Object {$_.Status -eq "Running"} | Out-Default}
Function RecentEvents {Get-EventLog -LogName System -Newest 30}
Function DomainStat {Get-ADDomain}
Function ADUsers {Get-ADUser -Filter *}
Function SearchUsers {get-Aduser -Filter {name -like "*robert*"}}
Function LockedUsers {Search-ADAccount -LockedOut}
Function DisabledUsers {Search-ADAccount -AccountDisabled}
Function UnlockAccount {Unlock-ADAccount -Identity PattiFu}
Function PwChange {Set-ADAccountPassword -Identity elisada -OldPassword (ConvertTo-SecureString -AsPlainText "p@ssw0rd" -Force) -NewPassword (ConvertTo-SecureString -AsPlainText "qwert@12345" -Force) ; Set-ADUser -Identity username -ChangePasswordAtLogon $true }
Function SpeedTest {C:\Users\Administrator\Downloads\ookla-speedtest-1.0.0-win64\speedtest | Out-Default}
Function GetDisk {Get-Disk}
Function MAC {getmac /v}
Function PrinterStats {Get-Printer ; Get-PrintConfiguration ; Get-PrinterDriver ; Get-PrinterPort ; Get-PrintJob ; Get-PrinterProperty | Out-Default}
Function Printer {Get-Printer | Out-Default}
Function PrinterDriver {Get-PrinterDriver | Out-Default}
Function PrintConfig {Get-PrintConfiguration | Out-Default}
Function PrinterPort {Get-PrinterPort | Out-Default}
Function PrintJob {Get-PrintJob | Out-Default}
Function PrinterPropterty {Get-PrinterProperty | Out-Default}
Function Devices {Get-CIMInstance Win32_PnPSignedDriver | select devicename,driverversion ; Get-CIMInstance Win32_SystemDriver | select name,@{n="version";e={(gi $_.pathname).VersionInfo.FileVersion}} | Out-Default}
Function GpudateRB {gpupdate /force ; shutdown /r }
Function GetVersion {Get-ComputerInfo -Property "*version" | Out-Default}







#Install Dependancies function	
Function InstallDP {Set-ExecutionPolicy RemoteSigned ; Install-Module PSWindowsUpdate ; Import-Module PSWindowsUpdate | Out-Default}

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
	 Write-Host "Author: Erick Gonzales"
     Write-Host ""
	 whoami ; Get-Date	 
     Write-Host ""
	 
     Write-Host "====================== $Title ======================"
     Write-Host ""
}


#Test submenu
function NetworkingMenu
{
     param (
           [string]$Title = 'Network tools'
     )
	 MenuTitle
     Write-Host "[ 1 ] Network Stats/Info"
     Write-Host "[ 2 ] IP Configuration Info"
     Write-Host "[ 3 ] MAC Address Info"
	 Write-Host "[ 4 ] Run Speedtest"
	 Write-Host "[ 5 ] Ping Google.com"
	 Write-Host "[ 6 ] Network Interface Statistics"
	 Write-Host "[ 7 ] Run Security Script"
	 Write-Host "[ m ] Main Menu"

	 
	 Write-Host ""
     Write-Host "[ q ] Quit"
	 Write-Host ""

While (($IDSelection = Read-Host -Prompt 'Please select an option') -notin 1,2,3,4,5,6,7,'m','q') 
{ 
    Write-Warning "$Selection is not a valid option" 
}

Switch ($IDSelection) {
	'm' { cls ; MainMenu }
    1 { cls ; NetworkStatScript }
    2 { cls ; ipconfig | Out-Default}
	3 { cls ; getmac /v | Out-Default}
	4 { cls ; C:\Users\Administrator\Downloads\ookla-speedtest-1.0.0-win64\speedtest | Out-Default }
	5 { cls ; echo ***PingingGoogle.com*** ; ping google.com | Out-Default }
	6 { cls ; netstat -e | Out-Default}
	7 { cls ; SecurityScript Out-Default}




	
	'q' { exit }
}
	 pause ; cls ; NetworkingMenu
}


function PrinterMenu
{
     param (
           [string]$Title = 'Printer tools'
     )
	 MenuTitle
     Write-Host "[ 1 ] All Printer Info"
     Write-Host "[ 2 ] List Printers"
     Write-Host "[ 3 ] Printer Drivers"
	 Write-Host "[ 4 ] Printer Configuration"
	 Write-Host "[ 5 ] Printer Port"
	 Write-Host "[ 6 ] Print Jobs"
	 Write-Host "[ 7 ] Printer Properties"
	 Write-Host "[ m ] Main Menu"

	 
	 Write-Host ""
     Write-Host "[ q ] Quit"
	 Write-Host ""

While (($IDSelection = Read-Host -Prompt 'Please select an option') -notin 1,2,3,4,5,6,7,'m','q') 
{ 
    Write-Warning "$Selection is not a valid option" 
}

Switch ($IDSelection) {
	'm' { cls ; MainMenu }
    1 { cls ; PrinterStats }
    2 { cls ; Printer }
	3 { cls ; PrinterDriver }
	4 { cls ; PrintConfig }
	5 { cls ; PrinterPort }
	6 { cls ; PrintJob }
	7 { cls ; PrinterProperty }
	
	'q' { exit }
}
	 pause ; cls ; PrinterMenu
}

function DiskMenu
{
     param (
           [string]$Title = 'Disk Tools'
     )
	 MenuTitle
     Write-Host "[ 1 ] Disk Stats/Info"
     Write-Host "[ 2 ] Run Clean Manager"
     Write-Host "[ 3 ] Full Cleanup"
	 Write-Host "[ 4 ] System Scan"
	 Write-Host "[ 5 ] Check Disk"
	 Write-Host "[ 6 ] Print Directory Tree"
	 
	 
	 Write-Host ""
     Write-Host "[ q ] Quit"
	 Write-Host ""

While (($IDSelection = Read-Host -Prompt 'Please select an option') -notin 1,2,3,4,5,6,'m','q') 
{ 
    Write-Warning "$Selection is not a valid option" 
}

Switch ($IDSelection) {
	'm' { cls ; MainMenu }
    1 { cls ; DiskStatScript }
    2 { cls ; Clean }
	3 { cls ; CleanupScript }
	4 { cls ; sfc /scannow }
	5 { cls ; chkdsk /r }
	6 { cls ; tree }



	
	'q' { exit }
}
	 pause ; cls ; DiskMenu
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
     Write-Host "[ 1 ] Terminal Task Manager"
     Write-Host "[ 2 ] Processes"
     Write-Host "[ 3 ] Active Services"
	 Write-Host "[ 4 ] Network Stats/Info"
	 Write-Host "[ 5 ] Disk Stats/Info"
	 Write-Host "[ 6 ] BIOS Info"
	 Write-Host "[ 7 ] Version info"
	 Write-Host "[ m ] Main Menu"

	 
	 Write-Host ""
     Write-Host "[ q ] Quit"
	 Write-Host ""

While (($IDSelection = Read-Host -Prompt 'Please select an option') -notin 1,2,3,4,5,6,7,'m','q') 
{ 
    Write-Warning "$Selection is not a valid option" 
}

Switch ($IDSelection) {
	'm' { cls ; MainMenu }
    1 {ntop | Out-Default }
    2 { cls ; Process40mb }
	3 { cls ; ActiveServices }
	4 { cls ; NetStatScript }
	5 { cls ; DiskStatScript }
	6 { cls ; BiosInfo }
	7 { cls ; GetVersion }

    'q' { exit }
}
	 pause ; cls ; Stats/MonitoringMenu
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

function HelpMenu
{
     param (
           [string]$Title = 'Help Menu'
     )
	 MenuTitle
	 Write-Host "Be careful and don't click the red button ;)"
 
	 Write-Host ""

     Write-Host "[ m ] Main Menu"
     Write-Host "[ q ] Quit"
	 Write-Host ""

While (($IDSelection = Read-Host -Prompt 'Please select an option') -notin 1,2,3,'m','q') 
{ 
    Write-Warning "$Selection is not a valid option" 
}

Switch ($IDSelection) {
	'm' { cls ; MainMenu }  	
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
     Write-Host "[ 1 ] Networking tools                  [ r ] Reboot"
     Write-Host "[ 2 ] Printer tools                     [ s ] Shutdown"
     Write-Host "[ 3 ] Disk tools                        [ l ] Logout"
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


While (($IDSelection = Read-Host -Prompt 'Please select an option') -notin 1,2,3,4,5,6,7,8,9,10,'h','q','i','s','r','l') 
{ 
    Write-Warning "$Selection is not a valid option" 
}

Switch ($IDSelection) {
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
    
	's' { shutdown /s /t 1 }
    'r' { shutdown /r /t 1 }
    'l' { logoff }
    'i' { cls ; InstallDP }
    'h'	{ cls ; HelpMenu }
	'q' { exit }
}
	 cls ; MainMenu
}

#Import modules
Import-Module PSWindowsUpdate

cls ; MainMenu