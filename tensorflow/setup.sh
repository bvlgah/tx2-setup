#!/bin/bash

#Install pip3
sudo apt install python3-pip
mkdir -p ~/.config/pip && \
    printf "[global]\nindex-url = https://pypi.tuna.tsinghua.edu.cn/simple" > ~/.config/pip/pip.conf
pip3 install --upgrade --user pip wheel numpy pillow matplotlib
printf "\n#Python\nif [ -d \"$HOME/.local/bin\" ] ; then\n    PATH=\"$HOME/.local/bin:$PATH\"\nfi" >> ~/.profile

#Install tensorflow 1.7
source ~/.profile
TENSORFLOW_PATH="$(dirname $0)/tensorflow-1.7.0-cp35-cp35m-linux_aarch64.whl"
pip3 install --upgrade --user ${TENSORFLOW_PATH}

#Reboot
sudo shutdown -r now
