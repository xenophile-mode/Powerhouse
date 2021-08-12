Function wginstall {
	$wgi = read-host "Install a package" ; winget install $wgi
} 
wginstall 
