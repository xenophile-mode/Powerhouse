Function CheckOUD {get-wulist -criteria "isinstalled=0 and deploymentaction=*" | Out-Default}
CheckOUD ; pause ; cd C:\Users\Administrator\Powerhouse ; ./Powerhouse.ps1
