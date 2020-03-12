cd "C:\Program Files (x86)\Jenkins\workspace\%JOB_NAME%"
set TFS= "C:\Program Files (x86)\Microsoft Visual Studio 10.0\Common7\IDE\tf.exe"
%TFS% workspaces /owner:804175 /computer:CTSC00902792401 /collection:https://cygnus.cognizant.com/tfs/dfsventuresingaporeptelimited /login:cts\804175,vinuthna@35cse
%TFS% workspace /delete Hudson-%JOB_NAME%-MASTER;804175 -noprompt /collection:https://cygnus.cognizant.com/tfs/dfsventuresingaporeptelimited  /login:cts\804175,vinuthna@35cse
%TFS% workspace -new Hudson-%JOB_NAME%-MASTER;804175 -noprompt -server:https://cygnus.cognizant.com/tfs/dfsventuresingaporeptelimited /login:cts\804175,vinuthna@35cse
%TFS% workfold "$/DFSSACommission/Working/SACommission/SAComm UI Code/" "C:\Program Files (x86)\Jenkins\workspace\%JOB_NAME%" /map /login:cts\804175,vinuthna@35cse /collection:https://cygnus.cognizant.com/tfs/dfsventuresingaporeptelimited /workspace:"Hudson-%JOB_NAME%-MASTER"
%TFS% get . -recursive -version:C3707 -noprompt /login:cts\804175,vinuthna@35cse


