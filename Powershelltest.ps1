Function New-UserFromCSV {
    Get-Printer ; Get-Disk | Out-Default
}

Function New-UserManual {
    #User manual input code..
}


Write-Host 'Create AD user:

  1. From CSV
  2. via Manual input
  q. Quit'


While (($Selection = Read-Host -Prompt 'Please select an option') -notin 1,2,'q') 
{ 
    Write-Warning "$Selection is not a valid option" 
}

Switch ($Selection) {
    1 { New-UserFromCSV }
    2 { New-UserManual }
}