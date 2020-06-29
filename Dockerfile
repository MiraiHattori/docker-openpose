FROM nvidia/cuda:10.2-cudnn7-devel-ubuntu18.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -q -qq && apt-get upgrade -q -qq -y && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN apt-get update -q -qq && apt-get upgrade -q -qq -y && apt-get install -y sudo vim git cmake build-essential libssl-dev qtbase5-dev qt5-default libprotobuf-dev libopencv-dev libgoogle-glog-dev

RUN git clone https://gitlab.kitware.com/cmake/cmake.git && \
    cd cmake && \
    ./configure --qt-gui && \
    ./bootstrap && \
    make install -j$(npoc) && \
    update-alternatives --install /usr/bin/cmake cmake /usr/local/bin/cmake 1 --force

RUN git clone --recursive https://github.com/CMU-Perceptual-Computing-Lab/openpose && \
    cd openpose && \
    sudo bash ./scripts/ubuntu/install_deps.sh && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make -j$(nproc)

