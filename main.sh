#!/bin/bash

STEAMCMD_DIR="/steamcmd"
VALHEIM_DEDICATED_SERVER_DIR="/valheim-dedicated-server"

: "${SERVER_NAME:=My server}"
: "${SERVER_PORT:=2456}"
: "${SERVER_WORLD:=Dedicated}"
: "${SERVER_PASSWORD:=secret}"

function install_valheim_dedicated_server() {
    cd "$STEAMCMD_DIR"

    ./steamcmd.sh +@sSteamCmdForcePlatformType linux +force_install_dir "$VALHEIM_DEDICATED_SERVER_DIR" +login anonymous +app_update 896660 validate +quit
}

function start_valheim_dedicated_server() {
    cd "$VALHEIM_DEDICATED_SERVER_DIR"

    export templdpath=$LD_LIBRARY_PATH
    export LD_LIBRARY_PATH=./linux64:"$LD_LIBRARY_PATH"
    export SteamAppId=892970

    COMMAND="./valheim_server.x86_64 -name \"$SERVER_NAME\" -port $SERVER_PORT -world \"$SERVER_WORLD\" -password \"$SERVER_PASSWORD\""

    if [ -n "$SERVER_PUBLIC" ]; then
        COMMAND="$COMMAND -public \"$SERVER_PUBLIC\""
    fi

    if [ -n "$SERVER_PRESET" ]; then
        COMMAND="$COMMAND -preset \"$SERVER_PRESET\""
    fi

    eval $COMMAND
}

function main() {
    install_valheim_dedicated_server

    start_valheim_dedicated_server
}

main "$@"
