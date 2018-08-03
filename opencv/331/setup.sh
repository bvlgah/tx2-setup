#!/bin/bash

# Create the root directory for OpenCV.
DIR=${HOME}/opencv
mkdir ${DIR}

# Unzip
unzip opencv-3.3.1.zip -d ${DIR}; unzip opencv_contrib-3.3.1.zip -d ${DIR}

#Create a directory for hold binary files
cd ${DIR}/opencv-3.3.1 && mkdir release && cd release

#Instal dependencies of OpenCV
sudo apt-get install -y build-essential
sudo apt-get install -y cmake git libgtk2.0-dev pkg-config \
    libavcodec-dev libavformat-dev libswscale-dev
sudo apt-get install -y python3-dev python3-numpy libtbb2 \
    libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev \
    libdc1394-22-dev

#Compile and install OpenCV
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local \
    -DOPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-3.3.1/modules .. && \
    make -j$(grep -c ^processor /proc/cpuinfo) && \
    sudo make install
