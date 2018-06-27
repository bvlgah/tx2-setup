#!/bin/bash

#Install curl
sudo apt install curl

# Create the root directory for OpenCV.
mkdir -p ~/opencv

# Download OpenCV 3.3.1 and extra modules.
curl https://codeload.github.com/opencv/opencv/zip/3.3.1 -o  ~/opencv/opencv-3.3.1.zip ; \
    curl https://codeload.github.com/opencv/opencv_contrib/zip/3.3.1 -o ~/opencv/opencv_contrib-3.3.1.zip

# Unzip
cd ~/opencv
unzip opencv-3.3.1.zip ; unzip opencv_contrib-3.3.1.zip

#Create a directory for hold binary files
cd opencv-3.3.1 && mkdir release && cd release

#Instal dependencies of OpenCV
sudo apt-get install build-essential
sudo apt-get install cmake git libgtk2.0-dev pkg-config \
    libavcodec-dev libavformat-dev libswscale-dev
sudo apt-get install python3-dev python3-numpy libtbb2 \
    libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev \
    libdc1394-22-dev

#Compile and install OpenCV
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local \
    -DOPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-3.3.1/modules .. && \
    make -j$(grep -c ^processor /proc/cpuinfo) && \
    sudo make install
