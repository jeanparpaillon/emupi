# emupi

Suite of tools for running emulated raspberrypi. All tools are finally
wrapped into a Docker container, with patched qemu from
https://github.com/Torlus/qemu/.

## start.sh

```
Usage: start.sh container /path/to/img
```

Top-level wrapper.

## emupi

Start qemu with a given raspberrypi image.

## rpimount

```
Usage: rpimount /path/to/img dir
```

Mount partitions of an raspberrypi image to the given directory.
Actually, only raspbian images are correctly detected (1st partition
is /boot, 2nd is /).

When option '-s', enter a shell after mounting. Partitions are
unmounted when exiting the shell.

## blkoffset

```
Usage: blkoffset /path/to/image X
```

Print the offset (in bytes) for accessing the Xth partition.

## Dockerfile

The Dockerfile describes a container with RaspberryPI patched version
of qemu, allowing to run unmodified RPI kernel. The image must be
mounted on /rpi.img.

WARNING: due to the use of loopback devices, container must run
privileged.

```
docker run --privileged -v /path/to/img:/rpi.img qemu-rpi
```
