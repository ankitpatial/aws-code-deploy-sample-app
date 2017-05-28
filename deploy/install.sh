#!/bin/bash
set -e
BASEDIR=$(dirname "$0")

## call the variables script.
. $BASEDIR/init.sh


echo "==> cd to $DEPLOY_APP_HOME"
cd $DEPLOY_APP_HOME


echo "==> install node packages..."
yarn install --production
