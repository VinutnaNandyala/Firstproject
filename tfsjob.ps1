if ((Get-PSSnapIn -Name Microsoft.TeamFoundation.PowerShell -ErrorAction SilentlyContinue) -eq $null)
{
    Add-PSSnapin Microsoft.TeamFoundation.PowerShell
}

#Load Reference Assemblies
[void][System.Reflection.Assembly]::LoadWithPartialName("Microsoft.TeamFoundation.Client")  
[void][System.Reflection.Assembly]::LoadWithPartialName("Microsoft.TeamFoundation.Build.Client")  
[void][System.Reflection.Assembly]::LoadWithPartialName("Microsoft.TeamFoundation.Build.Common")
[void][System.Reflection.Assembly]::LoadWithPartialName("Microsoft.TeamFoundation.WorkItemTracking.Client")


Function Get-TFSLatestFromVersionControl
{
param
(
    #FQDN to SCCM Server
    [Parameter(Mandatory=$true)][string]$YourServerPath = "$/DFSSACommission/Working/Concierge UI-Dev branch/",
    [Parameter(Mandatory=$true)][string]$YourLocalPath = "C:\Program Files (x86)\Jenkins\workspace\TFS_cmd",
    [Parameter(Mandatory=$false)][string]$tfsCollectionUrl = "https://cygnus.cognizant.com/tfs/dfsventuresingaporeptelimited"
)

    #Delete the old local copy
    if((Test-Path -Path ($YourLocalPath)) -eq 1 )
    {
        Remove-Item -Path $YourLocalPath -Recurse
        New-Item -Path $YourLocalPath -Type directory
    }


    #Get Team Project Collection
    $teamProjectCollection = [Microsoft.TeamFoundation.Client.TfsTeamProjectCollectionFactory]::GetTeamProjectCollection($tfsCollectionUrl)

    #enter a path to your tfs server
    $tfsServer = $tfsCollectionUrl
     # get an instance of TfsTeamProjectCollection
    $tfs=get-tfsserver $tfsServer
    # get an instance of VersionControlServer
    $vCS = $tfs.GetService([Microsoft.TeamFoundation.VersionControl.Client.VersionControlServer])
    $TeamProject = $YourServerPath.Remove(0,2)
    $tfsProject = $vcs.GetTeamProject($TeamProject)


    $workspace = $vcs.GetWorkspace($YourLocalPath)
    if($workspace -eq $null)
    {
        $vcs.DeleteWorkspace("TFS-"+$env:COMPUTERNAME,$env:USERNAME)
        $workspace = $vcs.CreateWorkspace("TFS-"+$env:COMPUTERNAME, $env:USERNAME)
    }

    $workspace.Map($YourServerPath, $YourLocalPath)

    $workspace.Get([Microsoft.TeamFoundation.VersionControl.Client.VersionSpec]::Latest ,[Microsoft.TeamFoundation.VersionControl.Client.GetOptions]::Overwrite)

}

