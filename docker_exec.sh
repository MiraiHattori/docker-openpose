#!/bin/bash

image="future731/openpose"
container="openpose"

xhost +si:localuser:root

# if ${container_name} exists

EXE=${@:-"/bin/bash"}

docker exec -it \
    -w=/userdir \
    ${container} \
    ${EXE}
