FROM microsoft/nanoserver
MAINTAINER seidchr+docker@gmail.com

SHELL ["powershell", "-command"]

RUN Install-PackageProvider NanoServerPackage -Force -ForceBootstrap
RUN Import-PackageProvider NanoServerPackage

RUN Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope LocalMachine -Force

#RUN Install-NanoServerPackage -Name Microsoft-NanoServer-Storage-Package
RUN Install-NanoServerPackage -Name Microsoft-NanoServer-IIS-Package

#RUN New-NetFirewallRule -Name "AspNet5 IIS" -DisplayName "Allow HTTP on TCP/8000" -Protocol TCP -LocalPort 8000 -Action Allow -Enabled True

# Creates an html file and adds content to this file.
#RUN echo "Hello World - Dockerfile" > c:\inetpub\wwwroot\index.html





#COPY packages packages/
#COPY Packages.xml config/

#RUN dism /online /apply-unattend:./config/Packages.xml
# ; exit 0

#RUN Get-Content C:/Windows/Logs/DISM/dism.log | Write-Host ; exit 1

#COPY Agent.mof config/dsc/
#RUN Start-DscConfiguration ./config/dsc/ -Verbose -Wait -Force
#RUN Test-DscConfiguration







CMD [ "powershell" ]