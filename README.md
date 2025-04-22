# Valheim Dedicated Server

A Docker image for running a dedicated Valheim server with BepInEx pre-installed.

## Features

- Based on the [cm2network/steamcmd](https://hub.docker.com/r/cm2network/steamcmd) Docker image
- Pre-installed with [BepInEx Valheim](https://valheim.thunderstore.io/package/denikson/BepInExPack_Valheim/) for mod support
- Automatically updates the server on container start

## Usage

### Pull the Image

```bash
docker pull ghcr.io/mariusraupach/valheim-dedicated-server:latest
```

### Docker Run Example

```bash
docker run -d \
    -p 2456-2458:2456-2458/udp \
    -e VALHEIM_DEDICATED_SERVER_NAME="My Server" \
    -e VALHEIM_DEDICATED_SERVER_PASSWORD="secret" \
    -v /path/to/Valheim:/home/steam/Valheim \
    -v /path/to/plugins:/home/steam/valheim-dedicated-server/BepInEx/plugins \
    --name valheim-server \
    ghcr.io/mariusraupach/valheim-dedicated-server:latest
```

### Docker Run Example

```yaml
services:
  valheim-dedicated-server:
    environment:
      - VALHEIM_DEDICATED_SERVER_NAME=My Server
      - VALHEIM_DEDICATED_SERVER_PASSWORD=secret
    image: ghcr.io/mariusraupach/valheim-dedicated-server:latest
    ports:
      - 2456-2458:2456-2458/udp
    restart: unless-stopped
    volumes:
      - ./Valheim:/home/steam/Valheim
      - ./plugins:/home/steam/valheim-dedicated-server/BepInEx/plugins
```

## Configuration

### Environment Variables

| Environment Variable                                         | Description                                                                                                                                                              |
| ------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `VALHEIM_DEDICATED_SERVER_NAME`                              | Enter the name of your server that will be visible in the Server list.                                                                                                   |
| `VALHEIM_DEDICATED_SERVER_PORT`                              |                                                                                                                                                                          |
| `VALHEIM_DEDICATED_SERVER_WORLD`                             | A World with the name entered will be created. You may also choose an already existing World by entering its name.                                                       |
| `VALHEIM_DEDICATED_SERVER_PASSWORD`                          | Set the password.                                                                                                                                                        |
| `VALHEIM_DEDICATED_SERVER_PUBLIC`                            |                                                                                                                                                                          |
| `VALHEIM_DEDICATED_SERVER_VALHEIM_DEDICATED_SERVER_LOG_FILE` | Sets the location to save the log file.                                                                                                                                  |
| `VALHEIM_DEDICATED_SERVER_SAVEINTERVAL`                      |                                                                                                                                                                          |
| `VALHEIM_DEDICATED_SERVER_BACKUPS`                           |                                                                                                                                                                          |
| `VALHEIM_DEDICATED_SERVER_BACKUPSHORT`                       |                                                                                                                                                                          |
| `VALHEIM_DEDICATED_SERVER_BACKUPLONG`                        |                                                                                                                                                                          |
| `VALHEIM_DEDICATED_SERVER_CROSSPLAY`                         |                                                                                                                                                                          |
| `VALHEIM_DEDICATED_SERVER_INSTANCEID`                        | If you’re hosting multiple servers with the same port from the same MAC address, write something unique here for each server to ensure that they get unique PlayFab IDs. |
| `VALHEIM_DEDICATED_SERVER_PRESET`                            | Sets world modifier preset. Setting a preset will overwrite any other previous modifiers. Valid values are: Normal, Casual, Easy, Hard, Hardcore, Immersive, Hammer.     |

## Acknowledgements

- [cm2network/steamcmd](https://hub.docker.com/r/cm2network/steamcmd)
- [BepInExPack Valheim](https://valheim.thunderstore.io/package/denikson/BepInExPack_Valheim/)
