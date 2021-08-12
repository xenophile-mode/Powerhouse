Function wgexport {
	$wgexp = read-host "Enter Filename" ; `
    winget export -o C:\Users\Administrator\$wgexp
}
wgexport 