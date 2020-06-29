#!/bin/bash

OPENPOSE_DIR=/openpose

cd ${OPENPOSE_DIR}
${OPENPOSE_DIR}/build/examples/openpose/openpose.bin --net_resolution=256x256 --video ${OPENPOSE_DIR}/examples/media/video.avi
