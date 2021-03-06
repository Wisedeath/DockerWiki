# Welcome to the Docker wiki!

**Docker** is a lightweight container virtualization software which utilizes **image-based containers** in order to promote reproducibility of software deployment through process isolation. By employing the kernel of a Linux host, Docker is granted access to _Namespaces_, _Control Groups_, and the _SELinux_ protocol which are used to maintain container isolation. These isolated **containers** are constructed using a **layered image model** by which the state of the container is held in a read-only layer of image layers. Docker proceeds to consolidate the image layers, creating a writable container layer to host the image while it is running. Docker’s containment infrastructure is made available to the user as the **Docker Engine**.

1. [Getting Started](https://github.com/Wisedeath/DockerWiki/wiki)
1. [More Information about Docker](https://github.com/Wisedeath/DockerWiki/wiki/Primer:-Docker-Engine)
1. [Dockerfile Reference](https://github.com/Wisedeath/DockerWiki/wiki/Reference:-Dockerfile)
1. [Docker Engine API Reference](https://github.com/Wisedeath/DockerWiki/wiki/Reference:-Docker-Engine-API)


# It should be noted this wiki was developed with Devicemapper, but only because RedHat (RHEL7) was utilized. There are simpler and better storage drivers that should be used if not using RedHat (RHEL7).
