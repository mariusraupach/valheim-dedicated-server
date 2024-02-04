# Valheim Dedicated Server

This Docker container allows you to deploy a dedicated server for Valheim, enabling you to run your own server for friends or the public. Below you will find instructions on how to use this container, including environment variable configurations and running the server.

## Prerequisites

Ensure Docker is installed and operational on your host system. For Docker installation instructions, refer to the official Docker documentation.

## Running the Server

Use the command below to start your Valheim dedicated server. Adjust the environment variables as needed to configure your server's settings:

```
docker run -d -p 2456-2457:2456-2457/udp mariusraupach/valheim-dedicated-server:latest
```

## Environment Variables

- `SERVER_NAME`: The name of your Valheim server as it will appear in the server list.
- `SERVER_PORT`: Choose the Port which you want the server to communicate with. Please note that this has to correspond with the Port Forwarding settings on your Router.
Valheim uses the specified Port AND specified Port+1. Default Ports are 2456-2457.
- `SERVER_WORLD`: A World with the name entered will be created. You may also choose an already existing World by entering its name.
- `SERVER_PASSWORD`: Set the password.
- `SERVER_PUBLIC`: Set the visibility of your server. 1 is default and will make the server visible in the browser.
Set it to 0 to make the server invisible and only joinable via the ‘Join IP’-button.
- `SERVER_PRESET`: Sets world modifier preset. Setting a preset will overwrite any other previous modifiers. Valid values are: Normal, Casual, Easy, Hard, Hardcore, Immersive, Hammer.

## Volumes

Three volumes are defined for persistence:

- /steamcmd: Where SteamCMD is installed. Used for updating the server.
- /valheim-dedicated-server: The Valheim server installation directory.
- /root/.config/unity3d/IronGate/Valheim: Stores server configuration and world data.

Map these volumes to your host system to maintain data persistence.

## Accessing the Server

Once the server is running, it will appear in Valheim's server list under the specified SERVER_NAME. Ensure SERVER_PUBLIC is set to 1 for public listing. Joining players must enter the SERVER_PASSWORD.
