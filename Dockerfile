FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu18.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -q -qq && apt-get upgrade -q -qq -y && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN apt-get update -q -qq && apt-get upgrade -q -qq -y && apt-get install -y \
    sudo vim git cmake build-essential libssl-dev \
    qtbase5-dev qt5-default libprotobuf-dev \
    libopencv-dev libgoogle-glog-dev \
    freeglut3-dev python3-opencv python3-dev python3-pip python3-opencv python3-numpy

RUN git clone --depth=1 https://gitlab.kitware.com/cmake/cmake.git && \
    cd cmake && \
    ./configure --qt-gui && \
    ./bootstrap && \
    make install -j$(nproc) && \
    update-alternatives --install /usr/bin/cmake cmake /usr/local/bin/cmake 1 --force

RUN git clone --recursive https://github.com/CMU-Perceptual-Computing-Lab/openpose && \
    cd openpose && \
    sudo bash ./scripts/ubuntu/install_deps.sh && \
    mkdir build && \
    cd build && \
    cmake .. -DOpenGL_GL_PREFERENCE=GLVND -DBUILD_PYTHON=ON -DWITH_3D_RENDERER=ON && \
    make && make install

