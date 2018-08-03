#!/bin/bash

# Set version of OpenCV
VERSION="3.4.1"

#Install curl
apt install -y curl

# Create the root directory for OpenCV.
mkdir -p ~/opencv

# Unzip
unzip opencv-${VERSION}.zip -d ~/opencv ; unzip opencv_contrib-${VERSION}.zip -d ~/opencv

#Create a directory for hold binary files
cd ~/opencv/opencv-${VERSION} && mkdir release && cd release

#Instal dependencies of OpenCV
apt-get install -y build-essential
apt-get install -y cmake git libgtk2.0-dev pkg-config \
    libavcodec-dev libavformat-dev libswscale-dev
apt-get install -y python3-dev python3-numpy libtbb2 \
    libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev \
    libdc1394-22-dev

#Compile and install OpenCV
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local \
    -DOPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-${VERSION}/modules .. && \
    make -j$(grep -c ^processor /proc/cpuinfo) && \
    make install
