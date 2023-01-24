# alfresco-installer
> Alfresco Installer

## Description

This project creates a Docker Image for the use of the project [Alfresco Docker Installer](https://github.com/alfresco/alfresco-docker-installer)

## Running

Only Docker is required to use this project.

Just type following command to produce Docker Compose template in current folder:

```
$ docker run -it -v "$(pwd):/generated" angelborroy/alfresco-installer
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
   create alfresco/modules/jars/activemq-broker-5.17.2.jar
```

Information related to the questions for Alfresco customization are available in [Alfresco Docker Installer](https://github.com/Alfresco/alfresco-docker-installer#running) project.

Once the files have been created, from the current folder, start the Docker Compose template using this command:

```
$ docker compose up --build --force-recreate
```

Service URLs are available in [Alfresco Docker Installer](https://github.com/Alfresco/alfresco-docker-installer#service-urls) project.


## Building

Despite is not required to build this Docker Image to use it (it's available as `angelborroy/alfresco-installer` in [Docker Hub](https://hub.docker.com/repository/docker/angelborroy/alfresco-installer/general)), following command will build the Docker Image:

```
$ docker buildx build --platform linux/amd64,linux/arm64 -t angelborroy/alfresco-installer:latest . --push
```

>> You may need to change the repository name `angelborroy` to your own.