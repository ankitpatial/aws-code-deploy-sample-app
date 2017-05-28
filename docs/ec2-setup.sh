#!/usr/bin/env bash
PATH="/usr/local/bin:$PATH"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

echo "LC_ALL=en_US.UTF-8" >> /etc/environment
echo "LANG=en_US.UTF-8" >> /etc/environment

sudo yum -y update
sudo yum -y install git-core gcc gcc-c++ make cmake openssl-devel wget

## Install NodeJs and some of its needed packages.
node_v=v6.10.3
echo "==> Install Node $node_v"
wget https://nodejs.org/dist/$node_v/node-$node_v-linux-x64.tar.gz
sudo tar -C /usr/local --strip-components 1 -xzf node-$node_v-linux-x64.tar.gz
rm node-$node_v-linux-x64.tar.gz

echo "==> Install node PM2 package..."
npm install -g pm2

pm2 install pm2-logrotate
pm2 set pm2-logrotate:retain

npm install -g yarn

echo "==> aws CodeDeploy"
wget https://aws-codedeploy-us-east-1.s3.amazonaws.com/latest/install
chmod +x ./install
sudo ./install auto
rm install

## YOU HAVE TO RUN THE OUTPUT OF BELOW COMMAND TO MAKE PM2 TO RELOAD PROCESS ON EC2 RE-START.
pm2 startup
