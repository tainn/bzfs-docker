# bzfs-docker

A minimal template for running BZFS via Docker, utilizing docker-compose for configuration.

Inside, placeholders `pitch` and `black` are used, which should be replaced with your own map or service names.

## Base image

Fedora's latest is used as the base image and can be changed with whichever underlying distro you wish that preferably
includes bzfs in their official repository. Using some minimal base and building from source is also possible to
minimize the image size, but adds maintenance complexity.

## Compose

Showcases running aforementioned `pitch` and `black` maps/services by building the local image and running each service
container separately on the same docker network.

The built image is tagged as `bzfs-fedora-base`, each service has its own external ports exposed, and runs the bzfs with
an attached corresponding config file, as well as second-level debugging enabled. Most of the configs present in this
file can be freely altered.

Prior to running, a docker network has to be created:

```sh
docker network create bzfs
```

The service containers can be run in daemon mode via:

```sh
docker-compose up pitch black --detach
```

Note that omitting explicitly specifying the services results in all services of that compose file being run.

## Core

Root directory which is copied into the built image and includes map/service-specific subdirectories. These
subdirectories primarily include their corresponding [`bzw`](https://wiki.bzflag.org/BZW)
and [`conf`](https://wiki.bzflag.org/Sample_conf) files. The contents of these files represent playable content in the
game and are therefore the map maker's domain.
