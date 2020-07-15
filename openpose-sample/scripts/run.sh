#!/bin/bash
OPENPOSE_SOURCE_DIR=/openpose
LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${OPENPOSE_SOURCE_DIR}/build/caffe/lib ./test  --model_folder=${OPENPOSE_SOURCE_DIR}/models --prototxt_path=pose/body_25/pose_deploy.prototxt
