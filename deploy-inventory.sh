#!/usr/bin/env bash
# Bash3 Boilerplate. Copyright (c) 2014, kvz.io

set -o errexit
set -o pipefail
set -o nounset
############### end of Boilerplate
# 
# Script to update the inventory file in `/etc/ansible/inventory`

git pull
sudo mkdir -p /etc/ansible # Not guaranteed for every Ansible installation
sudo cp inventory /etc/ansible/inventory