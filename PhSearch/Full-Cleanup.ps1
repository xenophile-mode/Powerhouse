Function CleanupScript { Clear-RecycleBin ; Clear-BCCache ; Remove-Item -Path $env:TEMP -Recurse -Force -ErrorAction SilentlyContinue }
CleanupScript ; pause ; cd C:\Users\Administrator\Powerhouse ; ./Powerhouse.ps1
