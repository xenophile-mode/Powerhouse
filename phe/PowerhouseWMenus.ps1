#Script/command functions
Function InstallDPP {Write-Host "Installing Scoop" ; Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh') ; Write-Host "Installing ntop"; scoop install ntop; Write-Host "Installing Speedtest-CLI" ; scoop insatll speedtest-cli; Write-Host "installing fzf" ; scoop insall fzf ; Write-Host "Installing PSWindowsUpdate Module" ; Set-ExecutionPolicy RemoteSigned ; Install-Module PSWindowsUpdate ; Import-Module PSWindowsUpdate ; Install-Module -Name wifiprofilemanagement ; Import-Module -Name wifiprofilemanagement | Out-Default }
Function InstallWU {Install-WindowsUpdate -AcceptAll -AutoReboot | Out-Default}
Function CheckOUD {get-wulist -criteria "isinstalled=0 and deploymentaction=*" | Out-Default}
Function CheckUD {get-wulist | Out-Default}
Function InstallOWU {Install-WindowsUpdate -criteria "isinstalled=0 and deploymentaction=*" -AutoReboot | Out-Default }
Function Clean {cleanmgr ; echo ***Running Cleanmgr*** | Out-Default}
Function Alias { New-Alias }
Function TestPrinter { Out-Printer | Out-Default}
Function UpdateWUCache { Get-Service -Name wuauserv,bits,cryptsvc | Stop-Service ; Remove-Item -Path "$env:ALLUSERSPROFILE\Application Data\Microsoft\Network\Downloader\qmgr*.dat" ; Get-Service -Name wuauserv,bits,cryptsvc | Start-Service ; Write-Host "***Windows Update Cache Updated***" | Out-Default }
Function InstallWUGP { gpupdate /force ; Install-WindowsUpdate -AcceptAll -Autoreboot | Out-Default}
Function CleanupScript { Clear-RecycleBin ; Clear-BCCache ; Remove-Item -Path $env:TEMP -Recurse -Force -ErrorAction SilentlyContinue }
Function NetStatScript { echo ***YOUR-HOSTNAME*** ; hostname ; Write-Host "" ; echo ***NetworkAdapterStats*** ; Get-NetAdapterStatistics ; Write-Host "" ; echo ***MACAddresses*** ; getmac /v ; Write-Host "" ; echo ***IPConfiguration*** ; ipconfig | Out-Default ; Write-Host "" ; echo ***PingingGoogle.com*** ; ping google.com ; Write-Host "" ; echo ***NetworkStatistics*** ; netstat -e ; Write-Host "" ; echo ***Printers*** ; Get-Printer | Out-Default ; Write-Host "" ; echo ***RunningSpeedtest*** ; speedtest | Out-Default } 
Function DiskStatScript { Get-Disk | Out-Default ; Get-Partition | Out-Default ; Get-PhysicalDiskStorageNodeView | Out-Default}
Function Chkdsk {chkdsk /scan | Out-Default}
Function Process40mb {Get-Process | Where-Object {$_.WorkingSet -gt 40000000} | Out-Default}
Function SecurityScript {Update-MpSignature ; echo ***UPDATED-ANTIMALWARE-DEFINITIONS*** ; Start-MpScan -ScanType QuickScan ; echo ***SCAN-COMPLETED*** ; Get-MpComputerStatus ; Get-MpThreat ; Get-MpThreatDetection | Out-Default}
Function BiosInfo {Get-CIMInstance -Class Win32_Bios | Format-List -Property *}
Function ActiveServices {Get-Service | Where-Object {$_.Status -eq "Running"} | Out-Default}
Function RecentEvents {Get-WinEvent -LogName 'System' -MaxEvents 20 | Format-List}
Function EventErrors {Get-WinEvent -FilterHashTable @{LogName='System';Level='2'} | Format-List}
Function SecEvents {Get-WinEvent -LogName 'Security' -MaxEvents 20 | Format-List} 
Function WarnEvents {Get-WinEvent -MaxEvents 20 -FilterHashTable @{LogName='System';Level='3'} | Format-List}
Function ST { speedtest | Out-Default}
Function GetDisk {Get-Disk | Out-Default}
Function MAC {getmac /v | Out-Default}
Function PrinterStats {Get-Printer | Out-Default ; Get-PrinterDriver | Out-Default ; Get-PrinterPort | Out-Default}
Function Printer {Get-Printer | Out-Default}
Function PrinterDriver {Get-PrinterDriver | Out-Default}
Function PrintConfig {$printcf = read-host "Specify printer" ; Get-PrintConfiguration -PrinterName ($printcf) | Out-Default}
Function PrinterPort {Get-PrinterPort | Out-Default}
Function PrintJob {$printcf = read-host "Specify printer" ; Get-PrintJob -PrinterName ($printcf) | Out-Default}
Function PrinterPropterty {$printcf = read-host "Specify printer" ; Get-PrinterProperty -PrinterName ($printcf) | Out-Default}
Function Devices {Get-CIMInstance Win32_PnPSignedDriver | select devicename,driverversion | Out-Default}
Function DevicesD {Get-CIMInstance Win32_SystemDriver | select name,@{n="version";e={(gi $_.pathname).VersionInfo.FileVersion}} | Out-Default}
Function GpudateRB {gpupdate /force ; shutdown /r | Out-Default}
Function GetVersion {Get-ComputerInfo -Property "*version" | Out-Default} 
Function FlushRegister {ipconfig /flushdns ; ipconfig /registerdns ; Write-Host "***DNS Flushed and Registered***" ; ipconfig /displaydns | Out-Default}
Function GetWifi {Get-WiFiAvailableNetwork | Out-Default}
function GetTemp {
    $t = Get-CimInstance MSAcpi_ThermalZoneTemperature -Namespace "root/wmi"
    $returntemp = @()

    foreach ($temp in $t.CurrentTemperature)
    {


    $currentTempKelvin = $temp / 10
    $currentTempCelsius = $currentTempKelvin - 273.15

    $currentTempFahrenheit = (9/5) * $currentTempCelsius + 32

    $returntemp += $currentTempCelsius.ToString() + " C : " + $currentTempFahrenheit.ToString() + " F : " + $currentTempKelvin + "K"  | Out-Default}
    return $returntemp
}
Function TestNet {Test-NetConnection | Out-Default }
Function nstat {netstat /b | Out-Default }
Function arpa {arp -a | Out-Default}
Function dhcpf {Get-CimInstance -Class Win32_NetworkAdapterConfiguration -Filter "DHCPEnabled=$true" | Format-Table -Property DHCP* | Out-Default}
Function dhcpr {Get-CimInstance -Class Win32_NetworkAdapterConfiguration -Filter "IPEnabled=$true and DHCPEnabled=$true" | Where-Object {$_.DHCPServer -contains '192.168.1.254'} | ForEach-Object -Process {$_.ReleaseDHCPLease()} ; Write-Host "***DHCP Leases released and renewed***" | Out-Default }
Function SpecEvent {Get-WinEvent -FilterHashtable @{LogName='System';StartTime=$StartTime;EndTime=$EndTime} | Out-Default }
Function PrintD {Get-Location | Out-Default}

#Search Function
Function Search { cd PhSearch ; $env:PATH =$env:PATH+";." ; fzf --layout=reverse | Invoke-Expression ; cd C:\Users\Administrator\Powerhouse ; exit }

#Add script 
Function AddSc {$script = read-host "Enter your script" ; $callf = read-host "Call Function" ; $scriptn = read-host "Enter script name" ; Add-Content -Path ('C:\Users\Administrator\Powerhouse\PhSearch\' + $scriptn ) -Value  $script ; Add-Content -Path ('C:\Users\Administrator\Powerhouse\PhSearch\' + $scriptn ) -Value  ( $callf + ' ; pause ; cd C:\Users\Administrator\Powerhouse ; ./Powerhouse.ps1') ; Write-Host "***Script added***" }




#Install Dependancies function	
Function InstallDP {Set-ExecutionPolicy RemoteSigned ; Install-Module PSWindowsUpdate ; Import-Module PSWindowsUpdate | Out-Default}


###Package management scripts
Function wgsearch {$wgs = read-host "Search for a package" ; winget search $wgs }
Function wginstall {$wgi = read-host "Install a package" ; winget install $wgi}
Function wgexport {$wgexp = read-host "Enter Filename" ; winget export -o C:\Users\Administrator\$wgexp}
Function wgimport {$wgimp = read-host "Enter Filename/Path" ; winget import -i $wgimp}



#Menu Title Functions
Function MenuTitle {
     Write-Host ""	 
	 Write-Host "______                      _ "
	 Write-Host "| ___ \                    | |"      
     Write-Host "| |_/ /____      _____ _ __| |__   ___  _   _ ___  ___ "      
     Write-Host "|  __/ _ \ \ /\ / / _ \ '__| '_ \ / _ \| | | / __|/ _ \"       
     Write-Host "| | | (_) \ V  V /  __/ |  | | | | (_) | |_| \__ \  __/"        
     Write-Host "\_|  \___/ \_/\_/ \___|_|  |_| |_|\___/ \__,_|___/\___|  V0.1"    
	 PrintD ; whoami ; Get-Date  
     Write-Host ""
	 
     Write-Host "====================== $Title ======================"
     Write-Host ""
}


#Menus
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
	 Write-Host "[ 8 ] Search Wifi Networks"
	 Write-Host "[ 9 ] Test Network Connection"
	 Write-Host "[ 10 ] Arp list"
	 Write-Host "[ 11 ] List Network Devices"
	 Write-Host "[ 12 ] DHCP Properties"
	 Write-Host "[ 13 ] Release and renew DHCP Leases"

	 Write-Host "[ m ] Main Menu"

	 
	 Write-Host ""
     Write-Host "[ q ] Quit"
	 Write-Host ""

While (($IDSelection = Read-Host -Prompt 'Please select an option') -notin 1,2,3,4,5,6,7,8,9,10,11,12,13,'m','q') 
{ 
    Write-Warning "$Selection is not a valid option" 
}

Switch ($IDSelection) {
	'm' { cls ; MainMenu }
    1 { cls ; NetStatScript }
    2 { cls ; ipconfig | Out-Default}
	3 { cls ; getmac /v | Out-Default}
	4 { cls ; ST }
	5 { cls ; echo ***PingingGoogle.com*** ; ping google.com | Out-Default }
	6 { cls ; netstat -e | Out-Default}
	7 { cls ; SecurityScript | Out-Default}
	8 { cls ; GetWifi }
	9 { cls ; TestNet }
	10 { cls ; arpa }
	11 { cls ; nstat }
	12 { cls ; dhcpf }
	13 { cls ; dhcpr }
	
    'q' { cls ; exit }
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
	
	'q' { cls ; exit }
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
	 Write-Host "[ m ] Main Menu"

	 
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



	
	'q' { cls ; exit }
}
	 pause ; cls ; DiskMenu
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
	 Write-Host "[ 5 ] Update Windows Update Cache"
	 Write-Host "[ 6 ] Group Policy Update and Windows Update"
	 Write-Host "[ 7 ] Group Policy Update with auto reboot"
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
    1 { cls ; CheckUD }
    2 { cls ; CheckOUD }
	3 { cls ; InstallWU	}
	4 { cls ; InstallOWU}
	5 { cls ; UpdateWUCache}
	6 { cls ; InstallWUGP}
	7 { cls ; GpudateRB}


	'q' { cls ; exit }
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
	 Write-Host "[ 8 ] Get Temperature"
	 Write-Host "[ 9 ] List recent events"
	 Write-Host "[ 10 ] List events with errors"
	 Write-Host "[ 11 ] List security events"
	 Write-Host "[ 12 ] List events with warnings"




	 
	 Write-Host "[ m ] Main Menu"

	 
	 Write-Host ""
     Write-Host "[ q ] Quit"
	 Write-Host ""

While (($IDSelection = Read-Host -Prompt 'Please select an option') -notin 1,2,3,4,5,6,7,8,9,10,11,12,'m','q') 
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
	8 { cls ; GetTemp }
	9 { cls ; RecentEvents }
	10 { cls ; EventErrors }
	11 { cls ; SecEvents }
	12 { cls ; WarnEvents }




	

    'q' { cls ; Exit-PSSession }
}
	 pause ; cls ; Stats/MonitoringMenu
}

function MaintanenceMenu
{
     param (
           [string]$Title = 'Maintanence tools'
     )
	 MenuTitle
     Write-Host "[ 1 ] Run Cleanup Script"
     Write-Host "[ 2 ] Run Clean Manager"
     Write-Host "[ 3 ] Run Security Script"
	 Write-Host "[ 4 ] Flush and Register DNS"
	 Write-Host "[ 5 ] Run Check Disk"
	 Write-Host "[ 6 ] Scan System"
	 Write-Host "[ m ] Main Menu"

	 
	 Write-Host ""
     Write-Host "[ q ] Quit"
	 Write-Host ""

While (($IDSelection = Read-Host -Prompt 'Please select an option') -notin 1,2,3,4,5,6,'m','q') 
{ 
    Write-Warning "$Selection is not a valid option" 
}

Switch ($IDSelection) {
	'm' { cls ; MainMenu }
    1 { cls ; CleanupScript }
    2 { cls ; Clean }
	3 { cls ; SecurityScript }
	4 { cls ; FlushRegister }
	5 { cls ; chkdsk /r }
	6 { cls ; sfc /scannow }

	
	
	'q' { cls ; exit }
}
	 pause ; cls ; MaintanenceMenu
}

function SoftwareMenu
{
     param (
           [string]$Title = 'Drivers/Software Menu'
     )
	 MenuTitle
     Write-Host "[ 1 ] Install Driver/Software"
     
	 Write-Host "[ m ] Main Menu"

	 
	 Write-Host ""
     Write-Host "[ q ] Quit"
	 Write-Host ""

While (($IDSelection = Read-Host -Prompt 'Please select an option') -notin 1,2,3,'m','q') 
{ 
    Write-Warning "$Selection is not a valid option" 
}

Switch ($IDSelection) {
	'm' { cls ; MainMenu }
    1 { cls ; Write-Host "Not setup yet" }
    
	
	'q' { cls ; exit }
}
	 pause ; cls ; SoftwareMenu
}

function DeviceMenu
{
     param (
           [string]$Title = 'Device tools'
     )
	 MenuTitle
	 Write-Host "[ 1 ] List Devices"
     Write-Host "[ 2 ] List Devices by driver"
	 Write-Host "[ 3 ] Insall Device Drivers"
     Write-Host "[ m ] Main Menu"

	 
	 Write-Host ""
     Write-Host "[ q ] Quit"
	 Write-Host ""

While (($IDSelection = Read-Host -Prompt 'Please select an option') -notin 1,2,3,'m','q') 
{ 
    Write-Warning "$Selection is not a valid option" 
}

Switch ($IDSelection) {
	'm' { cls ; MainMenu }
    1 { cls ; Devices }
    2 { cls ; DevicesD }
    3 { cls ; SoftwareMenu }

	
	'q' { cls ; exit }
}
	 pause ; cls ; DeviceMenu
}

function FileManMenu
{
     param (
           [string]$Title = 'File Management tools'
     )
	 MenuTitle
     Write-Host "[ 1 ] Print your current directory"
     

	 Write-Host "[ m ] Main Menu"

	 
	 Write-Host ""
     Write-Host "[ q ] Quit"
	 Write-Host ""

While (($IDSelection = Read-Host -Prompt 'Please select an option') -notin 1,'m','q') 
{ 
    Write-Warning "$Selection is not a valid option" 
}

Switch ($IDSelection) {
	'm' { cls ; MainMenu }
    1 { cls ; PrintD }
    
	
    'q' { cls ; exit }
}
	 pause ; cls ; FileManMenu
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
	'q' { cls ; exit }
}
	 HelpMenu
}

function MainMenu
{
     param (
           [string]$Title = 'Main Menu'
     )
	 MenuTitle
     Write-Host "[ / ] Search all tools                 [ R ] Reboot"	 
     Write-Host "[ a ] Add Script                       [ S ] Shutdown"	 
     Write-Host "[ 1 ] Networking tools                 [ L ] Logout"
     Write-Host "[ 2 ] Printer tools                    [ P ] Powerhouse"
     Write-Host "[ 3 ] Disk tools                       [ ps ] Powershell"
	 Write-Host "[ 4 ] Updating tools" 
	 Write-Host "[ 5 ] Monitoring tools"
	 Write-Host "[ 6 ] Maintanence scripts"
	 Write-Host "[ 7 ] Install Drivers/Software"
	 Write-Host "[ 8 ] Device tools"
	 Write-Host "[ 9 ] File Management tools"

	 Write-Host ""

	 Write-Host "[ i ] Install dependancies"
	 Write-Host "[ h ] Help"
     Write-Host "[ q ] Quit"
	 Write-Host ""


While (($IDSelection = Read-Host -Prompt 'Please select an option') -notin 1,2,3,4,5,6,7,8,9,'a','h','q','i','S','R','L','/','ps','P') 
{ 
    Write-Warning "$Selection is not a valid option" 
}

Switch ($IDSelection) {
	1 { cls ; NetworkingMenu }
    2 { cls ; PrinterMenu }
	3 { cls ; DiskMenu }
    4 { cls ; UpdatingMenu }
    5 { cls ; Stats/MonitoringMenu }
    6 { cls ; MaintanenceMenu }
    7 { cls ; SoftwareMenu }
    8 { cls ; DeviceMenu }
    9 { cls ; FileManMenu }
    '/'	{ cls ; Search }
    'a'	{ cls ; AddSc }


    
	'S' { shutdown /s /t 1 }
    'R' { shutdown /r /t 1 }
    'L' { shutdown /l }
    'P' { start powershell .\Powerhouse.ps1	}
    'ps' { start powershell }
    'i' { cls ; InstallDPP }
    'h'	{ cls ; HelpMenu }
    'q' { cls ; stop-process -Id $PID }
}
	 pause ; cls ; MainMenu
}

#Import modules
$env:PATH =$env:PATH+";." ; Import-Module PSWindowsUpdate ; Import-Module -Name wifiprofilemanagement

cls ; MainMenu