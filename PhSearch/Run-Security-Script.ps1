Function SecurityScript {Update-MpSignature ; echo ***UPDATED-ANTIMALWARE-DEFINITIONS*** ; Start-MpScan -ScanType QuickScan ; echo ***SCAN-COMPLETED*** ; Get-MpComputerStatus ; Get-MpThreat ; Get-MpThreatDetection | Out-Default}
SecurityScript ; pause ; cd C:\Users\Administrator\Powerhouse ; ./Powerhouse.ps1
