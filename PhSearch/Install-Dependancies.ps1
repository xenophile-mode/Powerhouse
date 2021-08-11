Function InstallPM {Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1')) ; Write-Host "Installing Scoop" ; Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')}

Function InstallMP {  Write-Host "Installing ntop"; scoop install ntop; Write-Host "Installing Speedtest-CLI" ; scoop insatll speedtest-cli; Write-Host "installing fzf" ; scoop insall fzf ; Write-Host "Installing PSWindowsUpdate Module" ; Set-ExecutionPolicy RemoteSigned ; Install-Module PSWindowsUpdate ; Import-Module PSWindowsUpdate ; Install-Module -Name wifiprofilemanagement ; Import-Module -Name wifiprofilemanagement | Out-Default }


function DependancyInstaller
{
     param (
           [string]$Title = 'Install Dependancies'
     )
	 MenuTitle
     Write-Host "[ c ] Cancel                 [ i ] Install Package Managers"
     Write-Host "                             [ p ] Install Packages/Modules"	 
	 Write-Host ""
	 Write-Host ""


While (($IDSelection = Read-Host -Prompt 'Please select an option') -notin 'i','c','p') 
{ 
    Write-Warning "$Selection is not a valid option" 
}

Switch ($IDSelection) {
    'i'	{ cls ; InstallPM }
	'p' { cls ; InstallMP }
    'c'	{ cls ; exit }
}
	 pause ; cls ; DependancyInstaller
}
cls ; DependancyInstaller
