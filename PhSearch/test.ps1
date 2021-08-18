Function SearchSch {
	$test = read-host "Specify Time (example 4.00PM)" ; CS | fzf -m --reverse --margin 5% `
	--border --prompt "Search for a tool:" --header " `
    ______                      _                          
    | ___ \                    | |                         
    | |_/ /____      _____ _ __| |__   ___  _   _ ___  ___ 
    |  __/ _ \ \ /\ / / _ \ '__| '_ \ / _ \| | | / __|/ _ \
    | | | (_) \ V  V /  __/ |  | | | | (_) | |_| \__ \  __/
    \_|  \___/ \_/\_/ \___|_|  |_| |_|\___/ \__,_|___/\___| v0.1

    ==================== Select a tool ====================" | ` 
	Invoke-Expression ; ($test) | Out-Default ; pause ; return ; SearchAll
}
SearchSch