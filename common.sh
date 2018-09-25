#!/bin/sh

# must be root
if [ 0 -ne $(/usr/bin/id -u) ]
then
    echo "Permission check failed, must be root." >&2
    exit 1
fi
