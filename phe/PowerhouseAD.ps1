#Script/Menu Functions
Function DomainStat {Get-ADDomain}
Function ADUsers {Get-ADUser -Filter *}
Function SearchUsers {$searchad = read-host "Search for a User in AD" ; Get-ADUser -filter ('displayname -like "*' + $searchad + '*"')}
Function LockedUsers {Search-ADAccount -LockedOut}
Function DisabledUsers {Search-ADAccount -AccountDisabled}
Function UnlockAccount {$ulad = read-host "Specify Account SAM Name" ; Unlock-ADAccount -Identity ($ulad) }
Function PwChange {$searchad = read-host "Specify Account SAM Name" ; $newpw = read-host "New Password" ; Set-ADAccountPassword -Identity ($searchad) -NewPassword (ConvertTo-SecureString -AsPlainText ($newpw) -Force) ; Set-ADUser -Identity ($searchad) -ChangePasswordAtLogon $true }

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

function ActiveDirectoryMenu
{
     param (
           [string]$Title = 'Active Directory tools'
     )
	 MenuTitle
     Write-Host "[ 1 ] Domain Info"
     Write-Host "[ 2 ] Search User in Active Directory"
     Write-Host "[ 3 ] List Disabled Users"
	 Write-Host "[ 4 ] List Locked Users"
	 Write-Host "[ 5 ] Unlock User Account"
	 Write-Host "[ 6 ] Reset User Password"
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
    1 { cls ; DomainStat }
    2 { cls ; SearchUsers }
	3 { cls ; DisabledUsers }
	4 { cls ; LockedUsers }
	5 { cls ; UnlockAccount }
	6 { cls ; PwChange }



	
	'q' { cls ; exit }
}
	 pause ; cls ; ActiveDirectoryMenu
}

cls ; ActiveDirectoryMenu