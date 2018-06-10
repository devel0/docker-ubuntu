#!/bin/bash

# Usage: ./build [addictional-docker-build-args]
#
# Example: ./build --network-dkbuild

exdir=$(dirname `readlink -f "$0"`)

docker build $args $* -t searchathing/ubuntu:bionic -f "$exdir"/Dockerfile "$exdir"/.
