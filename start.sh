#!/bin/bash

set -e

function _usage {
    echo "Usage: $0 container /path/to/img"
}

if test $# -lt 2; then
    _usage
    exit 1
fi

if test ! -e $2; then
    echo "E: Image not found "$2
fi

container=$1

xhost +
docker run --privileged -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v $2:/rpi.img $1

exit 0
