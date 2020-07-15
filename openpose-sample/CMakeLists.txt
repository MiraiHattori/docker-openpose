cmake_minimum_required(VERSION 3.0)
project(openpose-sample)

list(APPEND CMAKE_MODULE_PATH "/openpose/cmake/Modules")

find_package(OpenCV REQUIRED)
find_package(Threads REQUIRED)
find_package(GFlags REQUIRED)
find_package(Glog REQUIRED)
find_package(OpenPose REQUIRED)
find_package(Caffe REQUIRED)

add_executable(test src/test.cpp)
target_include_directories(test PUBLIC
    ${CUDA_INCLUDE_DIRS}
    ${CAFFE_INCLUDE_DIRS}
    ${OpenCV_INCLUDE_DIRS}
    ${OpenPose_INCLUDE_DIRS}
    ${GFLAGS_INCLUDE_DIR}
    ${GLOG_INCLUDE_DIR}
    )
target_link_libraries(test PUBLIC
    ${OpenCV_LIBS}
    ${OpenPose_LIBS}
    ${GFLAGS_LIBRARY}
    ${GLOG_LIBRARY}
    )
