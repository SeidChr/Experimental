param([String]$serverHostname)

Import-Module -Name ./AgentSetup.psm1 -Verbose
$agentName = "TeamCity Docker Build Agent"
Install-TeamCityAgent `
		-AgentName $agentName `
		-AgentHomeDirectory "./agent/" `
		-AgentWorkDirectory "./agentWork/" `
		-AgentPort 9090 `
		-ServerHostname $serverHostname `
		-ServerPort 80 `
		
#$serviceName = Get-TeamCityAgentServiceName -AgentName $agentName
#Start-Service -Name $serviceName

#Add-Type -AssemblyName System.IO.Compression -PassThru | ? IsPublic
