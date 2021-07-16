Function DiskStatScript { Get-Disk | Out-Default ; Get-Partition | Out-Default ; Get-PhysicalDiskStorageNodeView | Out-Default}
DiskStatScript ; pause ; cd C:\Users\Administrator\Powerhouse ; ./Powerhouse.ps1
