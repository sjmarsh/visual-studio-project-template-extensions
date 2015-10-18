. .\Settings.ps1

if($projectName -eq $null){
	$projectName = "TestProject" # for debug only!
}

Write-Output "Checking for Content Folder..."
if(Test-Path "\Content"){
	Write-Output "Content Folder Exists"
}
else {
	Write-Output "Creating Content Folder"
	New-Item "Content" -type directory
}

cd Content

Write-Output "Installing generator-fed..."
	& npm install yo generator-fed@^1 
	.\node_modules\.bin\yo.cmd fed [--name $projectName] [--static] [--install]

Write-Output "Installing node modules..."
	& npm config set registry http://npm:8080 
	& npm install --production --no-optional 
Write-Output "Gulping..."
	& node .\node_modules\gulp\bin\gulp all 

cd ..