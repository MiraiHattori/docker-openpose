#!/bin/bash

OPENPOSE_DIR=/openpose

cd ${OPENPOSE_DIR}
${OPENPOSE_DIR}/build/examples/openpose/openpose.bin --net_resolution=256x256 --number_people_max 1 --cli_verbose 0.2
# --tracking 5
