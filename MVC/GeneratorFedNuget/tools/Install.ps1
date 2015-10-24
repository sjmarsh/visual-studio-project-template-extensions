param($installPath, $toolsPath, $package, $project)
$projectFullName = $project.FullName
$debugString = "install.ps1 executing for " + $projectFullName
Write-Host $debugString

$fileInfo = new-object -typename System.IO.FileInfo -ArgumentList $projectFullName
$projectDirectory = $fileInfo.DirectoryName

$projectName = $project.Name
$contentPath = $projectName + "\Content"

Write-Host "Checking for Content Folder..."
if(Test-Path $contentPath){
	Write-Host "Content Folder Exists"
}
else {
	Write-Host "Creating Content Folder"
	New-Item "$contentPath" -type directory
}
cd $contentPath

Write-Host "Installing generator-fed..."
	& npm install yo generator-fed@^1 
	.\node_modules\.bin\yo.cmd fed [--name $projectName] [--static] [--install]

Write-Host "Installing node modules..."
	& npm config set registry http://npm:8080 
	& npm install --production --no-optional 
Write-Host "Gulping..."
	& node .\node_modules\gulp\bin\gulp all 
cd ..