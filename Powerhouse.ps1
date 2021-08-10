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
Function Search { cd PhSearch ; $env:PATH =$env:PATH+";." ; fzf -m --reverse --margin 5% --border --prompt "Search for a tool:" --header "______                      _                          
| ___ \                    | |                         
| |_/ /____      _____ _ __| |__   ___  _   _ ___  ___ 
|  __/ _ \ \ /\ / / _ \ '__| '_ \ / _ \| | | / __|/ _ \
| | | (_) \ V  V /  __/ |  | | | | (_) | |_| \__ \  __/
\_|  \___/ \_/\_/ \___|_|  |_| |_|\___/ \__,_|___/\___| v0.1

==================== Select a tool ====================" | Invoke-Expression ; pause ; cd C:\Users\Administrator\Powerhouse ; return ; Search }

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
     Write-Host "[ i ] Install dependancies             [ L ] Logout"
     Write-Host "[ h ] Help                             [ P ] Powerhouse"
     Write-Host "[ q ] Quit                             [ ps ] Powershell"
	

	 Write-Host ""
	 Write-Host ""


While (($IDSelection = Read-Host -Prompt 'Please select an option') -notin 'a','h','q','i','S','R','L','/','ps','P') 
{ 
    Write-Warning "$Selection is not a valid option" 
}

Switch ($IDSelection) {
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

#Keybindings
Set-PSReadlineKeyHandler -Key Alt+j -ScriptBlock {cls ; Search}
Set-PSReadlineKeyHandler -Key Alt+q -ScriptBlock { cls ; stop-process -Id $PID }


while ($true) {
  cls ; Search ; 
}
