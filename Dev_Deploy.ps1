$source = "C:\TFS_Jenkins\Output_DEV\_PublishedWebsites\LoyalTPL"
$destination = "C:\TFS_Jenkins\Output_DEV\_PublishedWebsites\LoyalTPL.zip"
write-Host"compress buildfiles to zip folder"

 If(Test-path $destination) {Remove-item $destination}

Add-Type -assembly "system.io.compression.filesystem"

[io.compression.zipfile]::CreateFromDirectory($Source, $destination) 
write-Host"compressed to zip folder"

Write-Host "Remote connection"
$server='10.176.35.146'
$Username='dfs\c_matrixreports'
$Password='GooddaY$'
$pw   = ConvertTo-SecureString $Password -AsPlainText -Force
$cred = New-Object Management.Automation.PSCredential ($Username, $pw)
$s = New-PSSession -computerName $server -credential $cred -Port 80

Write-Output "============ Your Application Deployment started.==================="
 Copy-Item $destination -Recurse -Destination "D:\PROD_compare" -ToSession $s
 Invoke-Command -Session $s -Command {D:\Powershell_Script\unzipping.ps1}
Write-Output "============ Your Application Deployment completed.==================="
