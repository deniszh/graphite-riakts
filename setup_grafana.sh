#!/bin/bash

cd download
wget https://grafanarel.s3.amazonaws.com/builds/grafana_3.1.1-1470047149_amd64.deb
apt-get install -y adduser libfontconfig
dpkg -i grafana_3.1.1-1470047149_amd64.deb
cd ..
