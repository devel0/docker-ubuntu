# docker-ubuntu

base ubuntu with some basic utilities and settings

## build image

```
./build.sh
```

you can specify addictional docker build arguments, example:

```
./build.sh --network=dkbuild
```

## run image

follow create a test named container running an interactive bash terminal

```
docker run --name test -ti searchathing/ubuntu /bin/bash
```

## dynamic entrypoints

on [derived images](https://github.com/devel0/docker-rdp/blob/75b0fd9a84cdef4a7c4e51dda318fc31de959ac5/Dockerfile#L5) you can set addictional entrypoints by placing an executable script in /entrypoint.d directory
