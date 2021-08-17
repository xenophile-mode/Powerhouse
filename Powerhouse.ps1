#Search Function
Function Search { 
    cd PhSearch ; $env:PATH =$env:PATH+";." ; fzf -m --reverse --margin 5% `
	--border --prompt "Search for a tool:" --header " `
    ______                      _                          
    | ___ \                    | |                         
    | |_/ /____      _____ _ __| |__   ___  _   _ ___  ___ 
    |  __/ _ \ \ /\ / / _ \ '__| '_ \ / _ \| | | / __|/ _ \
    | | | (_) \ V  V /  __/ |  | | | | (_) | |_| \__ \  __/
    \_|  \___/ \_/\_/ \___|_|  |_| |_|\___/ \__,_|___/\___| v0.1

    ==================== Select a tool ====================" | ` 
	Invoke-Expression ; pause ; return ; Search 
}

Function SearchAll {
	cd PhSearch ; $env:PATH =$env:PATH+";." ; CS | fzf -m --reverse --margin 5% `
	--border --prompt "Search for a tool:" --header " `
    ______                      _                          
    | ___ \                    | |                         
    | |_/ /____      _____ _ __| |__   ___  _   _ ___  ___ 
    |  __/ _ \ \ /\ / / _ \ '__| '_ \ / _ \| | | / __|/ _ \
    | | | (_) \ V  V /  __/ |  | | | | (_) | |_| \__ \  __/
    \_|  \___/ \_/\_/ \___|_|  |_| |_|\___/ \__,_|___/\___| v0.1

    ==================== Select a tool ====================" | ` 
	Invoke-Expression ; pause ; return ; SearchAll
}

Function CS {
	Get-Content all-commands.txt ; Get-ChildItem -Name
}

#Menu Title Functions
Function MenuInfo {
    whoami ; Get-Date  
}

Function MenuTitle {
     Write-Host ""	 
	 Write-Host "______                      _ "
	 Write-Host "| ___ \                    | |"      
     Write-Host "| |_/ /____      _____ _ __| |__   ___  _   _ ___  ___ "      
     Write-Host "|  __/ _ \ \ /\ / / _ \ '__| '_ \ / _ \| | | / __|/ _ \"       
     Write-Host "| | | (_) \ V  V /  __/ |  | | | | (_) | |_| \__ \  __/"        
     Write-Host "\_|  \___/ \_/\_/ \___|_|  |_| |_|\___/ \__,_|___/\___|  V0.1"    
	 MenuInfo  
     Write-Host ""
	 
     Write-Host "====================== $Title ======================"
     Write-Host ""
}

#Import modules
Function ModuleImport {
    $env:PATH =$env:PATH+";." ; Import-Module PSWindowsUpdate ; `
    Import-Module -Name wifiprofilemanagement
}
ModuleImport

#Keybindings
Function KeyBindings {
    Set-PSReadlineKeyHandler -Key Alt+j -ScriptBlock { 
	cls ; stop-process -Id $PID
	} 
	; Set-PSReadlineKeyHandler -Key Alt+q -ScriptBlock {
	cls ; stop-process -Id $PID 
    }
}
KeyBindings

while ($true) {
  cls ; SearchAll
}