Function wgsearch {
	$wgs = read-host "Search for a package" ; winget search $wgs 
}
wgsearch 
