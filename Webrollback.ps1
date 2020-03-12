$OriginalDir = "D:\Publish_backup\$((Get-Date).ToString('yyyy-MM-dd'))"
$backup='D:\Publish_backup'
$subFolderName;
Write-Output "============ Rollback Deployment started.==================="

 Remove-Item "D:\Publish\*" -Recurse -Force 


 #Get-ChildItem -Path "$backup\$((Get-Date).ToString('yyyy-MM-dd'))\$subFolderName\*" | Copy-Item -Destination "D:\Publish\" -Recurse
 # Copy-Item "$backup\$((Get-Date).ToString('yyyy-MM-dd'))\$subFolderName\*" -Recurse -Destination "D:\Publish\" 
 # get-childitem -path "$backup\$((Get-Date).ToString('yyyy-MM-dd'))\*"| 
  #  sort-object -Property $_.CreationTime | 
  #  select-object -last 1\* | Copy-Item -Destination "D:\Publish\" -Recurse
$latest= get-childitem -path "$backup\$((Get-Date).ToString('yyyy-MM-dd'))\"| 
    sort-object -Property $_.CreationTime | 
    select-object -last 1 
echo "$OriginalDir"
echo "$latest"
copy-item -path "$OriginalDir\$Latest\*" -Destination "D:\Publish\" -recurse -force
Write-Output "============ Your Application Deployment completed.==================="


