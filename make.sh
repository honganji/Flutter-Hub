#!/bin/bash

if [ -f .env ]; then
    export $(cat .env | xargs)
fi

MAKEFILE=${MAKEFILE:-Makefile}

make -f $MAKEFILE "$@"
