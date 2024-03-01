# alfresco-installer
> Alfresco Installer

## Description

This project creates a Docker Image for the use of the project [Alfresco Docker Installer](https://github.com/alfresco/alfresco-docker-installer).

**NOTE** The code included in this project is not required to follow the instructions described in the **Running** section, so no project cloning is not required at all. **Building** section is only relevant for *developers* willing to contribute to the project.

## Requirements

Only [Docker](https://docs.docker.com/get-docker/) is required.

* Before executing this installer be sure that Docker is running in your computer. Installation instructions are available in [Docker documentation](https://docs.docker.com/engine/install/), note that the process is different for every supported OS (Linux, MacOS and Windows).
* When Docker is up & ready verify that **16 GB** of Memory are available. Since Alfresco can be used with less than 16 GB of RAM, this amount of memory is the recommended amount. Instructions to change Memory allocation are available in [Docker documentation](https://docs.docker.com) for every supported OS:
  * [Changing Resources in Mac](https://docs.docker.com/desktop/settings/mac/#resources)
  * [Changing Resources in Windows](https://docs.docker.com/desktop/settings/windows/#resources)
  * [Changing Resources in Linux](https://docs.docker.com/desktop/settings/linux/)

## Running

Verify Docker is up & ready.

```
$ docker -v
Docker version 20.10.21, build baeda1f
```

Create a new folder to hold files and folders created by this installer:

```
$ mkdir alfresco
$ cd alfresco
```

Type following command to produce Docker Compose template in current folder (like `alfresco`) when using Linux or MacOS:

```
$ docker run -it -v $(pwd):/generated angelborroy/alfresco-installer
```

>> Note. When using Linux as host (e.g. Ubuntu 22.04), add permissions for user `501` to the folder used to create Alfresco Docker assets:
```bash
$ mkdir alfresco
$ sudo chown 501 alfresco
$ cd alfresco
$ sudo docker run -it -v $(pwd):/generated angelborroy/alfresco-installer
```

If you are using *Windows*, type this alternative syntax from [PowerShell](https://learn.microsoft.com/en-us/powershell/):

```
$ docker run -it -v ${PWD}:/generated angelborroy/alfresco-installer
```

This command will start prompting a battery of questions to customize the Alfresco installation:

```
DOCKER COMPOSE ALFRESCO

? Which ACS version do you want to use? (Use arrow keys)
  6.1
  6.2
  7.0
  7.1
  7.2
  7.3
  7.4
  23.1
❯ 23.2
```

Information related to the questions for Alfresco customization are available in [Alfresco Docker Installer](https://github.com/Alfresco/alfresco-docker-installer#running) project. If you are not familiar with any of them, just choose *default* option.

Once all the questions have been answered, the program will provide some information to start Alfresco using Docker. Note that SERVICE URLs information may be different depending on the options selected before.

```
---------------------------------------------------
STARTING ALFRESCO

Start Alfresco using the command "docker compose up"
Once the plaform is ready, you will find a line similar to the following one in the terminal:
alfresco-1 | org.apache.catalina.startup.Catalina.start Server startup in [NNNNN] milliseconds

SERVICE URLs

   * UI: http://localhost/
   * Legacy UI (users & groups management): http://localhost/share
   * Repository (REST API): http://localhost/alfresco

Remember to use as credentials:

   * username: admin
   * password: admin

---------------------------------------------------
```

After the information to start Alfresco, there is a list of files created in current folder (like `alfresco`)

```
...
   create .env
   create docker-compose.yml
   create alfresco/Dockerfile
   create alfresco/modules/amps/empty
   create alfresco/modules/jars/empty
   create share/Dockerfile
   create share/web-extension/share-config-custom-dev.xml
   create share/modules/amps/empty
   create share/modules/jars/empty
   create search/Dockerfile
   create config/nginx.conf
   create config/nginx.htpasswd
```

These files describe the Alfresco configuration to be executed when using Docker Compose.

As described in the "STARTING ALFRESCO" section, type following command in the terminal and wait Alfresco to be ready.

```
$ docker compose up
...
alfresco-alfresco-1 | org.apache.catalina.startup.Catalina.start Server startup in [38213] milliseconds
```

From this point, Alfresco is ready to be used. Type any of the "SERVICE URLs" in the browser using selected credentials.

## Stopping

Alfresco can be stopped typing `Ctrl+C` in the terminal used to start the Docker Compose (remember that you typed there `docker compose up`). If you want to start again Alfresco, just type `docker compose up` from the folder used to produce the configuration (like `alfresco`).

## Video recording

Additional details on how to follow above instructions are provided in following video recording:

[![Easiest Way to Install Alfresco 7.3 using Docker Compose](https://i.ytimg.com/vi/Lg49CoY8yl4/hqdefault.jpg?sqp=-oaymwEcCNACELwBSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLBn3qd1x4ChgfMQhRlQ4RwOrdCCCQ)](https://www.youtube.com/watch?v=Lg49CoY8yl4)

[Easiest Way to Install Alfresco 7.3 using Docker Compose](https://www.youtube.com/watch?v=Lg49CoY8yl4)

## Building

**NOTE** This section only applies to developers willing to create the Docker Image from scratch or to contribute to the project.

Despite is not required to build this Docker Image to use it (it's available as `angelborroy/alfresco-installer` in [Docker Hub](https://hub.docker.com/repository/docker/angelborroy/alfresco-installer/general)), following command will build the Docker Image:

```
$ docker buildx build --platform linux/amd64,linux/arm64 -t angelborroy/alfresco-installer:latest . --push
```

>> You may need to change the repository name `angelborroy` to your own.
