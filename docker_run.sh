#!/bin/bash

image="future731/openpose"
container="openpose"

xhost +si:localuser:root

# if ${container_name} exists
docker rm ${container}

EXE=${@:-"/bin/bash"}

docker run --rm -it \
    --privileged \
    --gpus=all \
    --net=host \
    --env=DISPLAY \
    --env=QT_X11_NO_MITSHM=1 \
    --volume=/tmp/.X11-unix:/tmp/.X11-unix:rw \
    --name=${container} \
    --volume=${PROG_DIR:-$(pwd)}:/userdir \
    -w=/userdir \
    ${image} ${EXE}
