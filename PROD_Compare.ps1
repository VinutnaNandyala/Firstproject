Write-Host "Remote connection"
$server='10.176.35.146'
$Username='dfs\c_matrixreports'
$Password='GooddaY$'
$pw   = ConvertTo-SecureString $Password -AsPlainText -Force
$cred = New-Object Management.Automation.PSCredential ($Username, $pw)
$s = New-PSSession -computerName $server -credential $cred -Port 80

Write-Output "============ Comparing and copying new changes to Diff folder==================="
 Copy-Item "C:\Output_DEV\_PublishedWebsites\LoyalTPL\*" -Recurse -Destination "D:\PROD_Compare" -ToSession $s

Invoke-Command -Session $s -Command {D:\Powershell_Script\compare.ps1}

Write-Output "============ created folder with new changes==================="



