FROM debian:latest

EXPOSE 2456/udp 2457/udp 2458/udp

VOLUME ["/steamcmd", "/valheim-dedicated-server", "/root/.config/unity3d/IronGate/Valheim"]

WORKDIR /steamcmd

RUN apt-get update && \
    apt-get install -y curl lib32gcc-s1 && \
    curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf - -C .

WORKDIR /

COPY ./main.sh .

RUN chmod +x main.sh

CMD ["./main.sh"]