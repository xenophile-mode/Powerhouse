Function DevicesD {Get-CIMInstance Win32_SystemDriver | select name,@{n="version";e={(gi $_.pathname).VersionInfo.FileVersion}} | Out-Default}
DevicesD
