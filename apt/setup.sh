#!/bin/bash
CONFIG_PATH="$(dirname $0)/sources.list"
sudo mv /etc/apt/sources.list /etc/apt/sources.list.backup
sudo cp ${CONFIG_PATH} /etc/apt/sources.list
sudo apt update
