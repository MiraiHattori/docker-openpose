# How to setup
```bash
./docker_build.sh
./docker_run.sh
# in docker
cd /openpose/build
make install
cd /userdir/openpose-sample
mkdir build
cd build
cmake ..
make
# connect webcam
../scripts/run.sh
```
