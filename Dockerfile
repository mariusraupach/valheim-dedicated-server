FROM cm2network/steamcmd:steam-bookworm

ENV INSTALL_DIR=/home/steam/valheim-dedicated-server
ENV SteamAppID=892970
ENV DOORSTOP_CORLIB_OVERRIDE_PATH=${INSTALL_DIR}/unstripped_corlib
ENV DOORSTOP_ENABLE=TRUE
ENV DOORSTOP_INVOKE_DLL_PATH=${INSTALL_DIR}/BepInEx/core/BepInEx.Preloader.dll
ENV LD_LIBRARY_PATH="${INSTALL_DIR}/doorstop_libs:${INSTALL_DIR}/linux64:${LD_LIBRARY_PATH}"
ENV LD_PRELOAD="${INSTALL_DIR}/doorstop_libs/libdoorstop_x64.so:$LD_PRELOAD"

USER root

RUN apt-get update && \
    apt-get install -y \
    libatomic1 \
    libpulse-dev \
    libpulse0 && \
    rm -rf /var/lib/apt/lists/*

USER steam

COPY --chmod=755 --chown=steam:steam entrypoint.sh /entrypoint.sh
COPY --chown=steam:steam BepInEx/BepInExPack_Valheim/BepInEx/ ${INSTALL_DIR}/BepInEx/
COPY --chown=steam:steam BepInEx/BepInExPack_Valheim/doorstop_libs/ ${INSTALL_DIR}/doorstop_libs/

EXPOSE 2456-2458/udp

VOLUME ["/home/steam/Valheim", "/home/steam/valheim-dedicated-server/BepInEx/plugins"]

ENTRYPOINT ["/entrypoint.sh"]

CMD []