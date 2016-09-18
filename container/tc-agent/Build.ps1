# pass your teamcity server hostname here
param([String]$serverHostname)

# In case we need nanoserver packages to be installed in the container, 
# they need to be downloaded beforehand and copied there. downloading wont work in the container itself

#Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force
#Install-PackageProvider NanoServerPackage -Force -ForceBootstrap
#Save-NanoServerPackage -Name Microsoft-NanoServer-DSC-Package -Path packages -Force


# since downloads wont work on a container (for what reason ever), also the agent needs to be downloaded beforehand
# i am also unzipping it directly ... because who cares (and it will most likely not work on the container...). 
$serverProtocol = "https"

$destination = "./agent/"
$installationZipFilePath = "./buildAgent.zip"

if ((test-path $installationZipFilePath) -ne $true)
{
	Write-Verbose "Downloading TeamCity Agent installation zip from $teamCityAgentInstallationZipUrl to $installationZipFilePath"
    $teamCityAgentInstallationZipUrl = "$($serverProtocol)://$($serverHostname)/update/buildAgent.zip"
    Invoke-WebRequest $teamCityAgentInstallationZipUrl -OutFile $installationZipFilePath -UseBasicParsing
	Expand-Archive $installationZipFilePath -DestinationPath $destination
	Write-Verbose "Downloaded and extracted TeamCity Agent installation zip to $installationZipFilePath"
}

docker build .