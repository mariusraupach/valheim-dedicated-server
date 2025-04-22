#!/bin/bash

set -euo pipefail

: "${INSTALL_DIR}"
: "${SteamAppID}"

steamcmd_args=(
    "+@sSteamCmdForcePlatformType" "linux"
    "+force_install_dir" "${INSTALL_DIR}"
    "+login" "anonymous"
    "+app_update" "${SteamAppID}" "validate"
    "+quit"
)

/home/steam/steamcmd/steamcmd.sh "${steamcmd_args[@]}"

valheim_args=(
    -name "${VALHEIM_DEDICATED_SERVER_NAME}"
    -port "${VALHEIM_DEDICATED_SERVER_PORT}"
    -world "${VALHEIM_DEDICATED_SERVER_WORLD}"
    -password "${VALHEIM_DEDICATED_SERVER_PASSWORD}"
    -savedir "/home/steam/Valheim"
    -public "${VALHEIM_DEDICATED_SERVER_PUBLIC}"
    -logFile "${VALHEIM_DEDICATED_SERVER_LOG_FILE}"
    -saveinterval "${VALHEIM_DEDICATED_SERVER_SAVEINTERVAL}"
    -backups "${VALHEIM_DEDICATED_SERVER_BACKUPS}"
    -backupshort "${VALHEIM_DEDICATED_SERVER_BACKUPSHORT}"
    -backuplong "${VALHEIM_DEDICATED_SERVER_BACKUPLONG}"
    -instanceid "${VALHEIM_DEDICATED_SERVER_INSTANCEID}"
    -preset "${VALHEIM_DEDICATED_SERVER_PRESET}"

)

if [[ "${VALHEIM_DEDICATED_SERVER_CROSSPLAY,,}" == "true" ]]; then
    valheim_args+=(-crossplay)
fi

"${INSTALL_DIR}/valheim_server.x86_64" "${valheim_args[@]}"
