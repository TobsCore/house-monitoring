#! /bin/bash
set -euox pipefail
NODE_EXPORTER_PATH=$(which node_exporter)
sed "s~/PATH/TO/node_exporter~$NODE_EXPORTER_PATH~g" node_exporter.service > /tmp/service-file

# These commands need to be run with root priviliges
echo 'Installing and starting node_exporter as service'
echo 'The following commands are run as root'
sudo mv /tmp/service-file /lib/systemd/system/node_exporter.services
sudo systemctl daemon-reload
sudo systemctl start node_exporter
