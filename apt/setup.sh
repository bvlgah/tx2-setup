#!/bin/bash

sudo mv /etc/apt/sources.list /etc/apt/sources.list.backup
sudo cp sources.list /etc/apt/sources.list
sudo apt update
