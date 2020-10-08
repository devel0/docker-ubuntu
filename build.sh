#!/bin/bash

# Usage: ./build [addictional-docker-build-args]
#
# Example: ./build --network=dkbuild

NODEJS_PACKAGE=node-v10.16.1-linux-x64.tar.xz

exdir=$(dirname `readlink -f "$0"`)

DOWNLOADS="$exdir"/Downloads

if [ ! -e "$DOWNLOADS" ]; then
	mkdir "$DOWNLOADS"
fi

if [ ! -e "$DOWNLOADS/$NODEJS_PACKAGE" ]; then
	echo "missing $DOWNLOADS/$NODEJS_PACAKGE please download from https://nodejs.org/en/download/"
	exit 1
fi

docker build $args $* -t searchathing/ubuntu:focal -f "$exdir"/Dockerfile "$exdir"/.
