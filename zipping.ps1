$source = "C:\TFS_Jenkins\Output_DEV\_PublishedWebsites\LoyalTPL"

$destination = "C:\TFS_Jenkins\Output_DEV\_PublishedWebsites\LoyalTPL.zip"

 If(Test-path $destination) {Remove-item $destination}

Add-Type -assembly "system.io.compression.filesystem"

[io.compression.zipfile]::CreateFromDirectory($Source, $destination) 