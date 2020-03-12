$BackUpPath = “D:\PROD_Compare”

$Destination = “D:\Publish”

Add-Type -assembly “system.io.compression.filesystem”

[io.compression.zipfile]::ExtractToDirectory($BackUpPath, $destination)