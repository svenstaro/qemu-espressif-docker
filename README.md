# qemu-espressif-docker
A container image containing the qemu fork of espressif to add support for the xtensa architecture.

See also https://github.com/espressif/qemu/wiki

## How to use this
It's recommended that you just use the image directly from Docker Hub like so:

    docker run docker.io/svenstaro/qemu-espressif

or

    podman run docker.io/svenstaro/qemu-espressif

## How to build
If you actually want to build this yourself you can easily do so.
Run either

    docker build -t qemu-espressif

or

    podman build -t qemu-espressif
