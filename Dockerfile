FROM openjdk:8-windowsservercore

MAINTAINER peter@pouliot.net
ENV NEXUS3_VERSION 3.11.01

ENV INSTALL4J_ADD_VM_PARAMS="-Xms1200m -Xmx1200m -XX:MaxDirectMemorySize=2g -Djava.util.prefs.userRoot=${NEXUS_DATA}/javaprefs"
COPY Dockerfile C:\\Dockerfile

RUN mkdir -p C:\\nexus3

RUN \
    # Install Chocolatey
    Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

RUN \
    # Install Choco Package              
    choco install javaruntime nexus-repository -Y ; \
    refreshenv ;\

VOLUME C:\\nexus3
# ENTRYPOINT [ "cmd", "/C", "nexus.exe /run" ]
