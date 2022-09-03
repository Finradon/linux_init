#!/bin/bash

apt install python3-influxdb python3-smbus
pip3 install smbus2

curl -sL https://packages.grafana.com/gpg.key | apt-key add -
curl -sL https://repos.influxdata.com/influxdb.key | apt-key add -
echo "deb https://repos.influxdata.com/debian buster stable" | tee /etc/apt/sources.list.d/influxdb.list
echo "deb https://packages.grafana.com/oss/deb stable main" | tee /etc/apt/sources.list.d/grafana.list

apt update
apt install grafana influxdb

mkdir /usr/share/grafana/data
chown grafana:grafana /usr/share/grafana/data

echo 'export infconf="sudo nano /etc/influxdb/influxdb.conf"' >> $HOME/.bashrc
systemctl stop influxdb
 