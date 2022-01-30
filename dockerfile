FROM ubuntu:focal

ADD https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz ./

# SteamCMD Requirements:
# - Complains about the absense of curl
# - Requires lib32gcc1 to function
RUN apt-get update -y
RUN apt-get install -y curl
RUN apt-get install -y lib32gcc1

RUN mkdir /steamsdk
RUN tar -xvf /steamcmd_linux.tar.gz -C /steamsdk

RUN echo '/steamsdk/steamcmd.sh +login $PARAM_STEAM' > /test.sh
RUN chmod 777 /test.sh

# CMD ["sh", "-c","/steamsdk/steamcmd.sh", "$STEAM_COMMANDS"]
#ENTRYPOINT ["/steamsdk/steamcmd.sh", "$PARAM_STEAM"]
#ENTRYPOINT ["test.sh"]
ENTRYPOINT ["/bin/bash"]
#CMD ["cat", "/test.sh"]
