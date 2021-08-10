Function CleanupScript { Clear-RecycleBin ; Clear-BCCache ; Remove-Item -Path $env:TEMP -Recurse -Force -ErrorAction SilentlyContinue }
CleanupScript 