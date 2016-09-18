FROM microsoft/nanoserver
MAINTAINER seidchr+docker@gmail.com

ARG SERVER_HOSTNAME
RUN echo Server: ${SERVER_HOSTNAME}

SHELL ["powershell", "-command"]
WORKDIR c:/

#COPY packages packages/
#COPY Packages.xml config/

#RUN dism /online /apply-unattend:./config/Packages.xml
# ; exit 0

## when you want to check the log output uncomment the exit part and put it behind the dism. 
## also uncomment the following line

#RUN Get-Content C:/Windows/Logs/DISM/dism.log | Write-Host ; exit 1

COPY ["AgentSetup.ps1", "AgentSetup.psm1", "./"]
COPY agent ./agent/

RUN ./AgentSetup.ps1 ${SERVER_HOSTNAME}

CMD [ "powershell" ]