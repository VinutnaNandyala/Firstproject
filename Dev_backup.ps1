Write-Host "Remote connection"
$server='10.176.35.146'
$Username='dfs\c_matrixreports'
$Password='GooddaY$'
$pw   = ConvertTo-SecureString $Password -AsPlainText -Force
$cred = New-Object Management.Automation.PSCredential ($Username, $pw)
#try {
   $s = New-PSSession -computerName $server -credential $cred -Port 80
Invoke-Command -Session $s -Command {D:\Powershell_Script\Webbackup.ps1}
#Invoke-Command -Session $s -FilePath C:\Users\804175\Documents\Untitled5.ps1

#Remove-PSSession