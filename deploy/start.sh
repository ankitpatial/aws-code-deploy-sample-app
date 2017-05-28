#!/bin/bash
BASEDIR=$(dirname "$0")

## call the variables script.
. $BASEDIR/init.sh

## uncomment the below line in case you want to read the ec2 instance tags e.g env:NODE_ENV, env:DB
#. ./read-ec2-tags.sh

cd $DEPLOY_APP_HOME

## We are going to use PM2(http://pm2.keymetrics.io/) to manage our node server process.
pm2 start --name $DEPLOY_APP -u $DEPLOY_USER --env $NODE_ENV ./app/server.js -i 1

pm2 save
