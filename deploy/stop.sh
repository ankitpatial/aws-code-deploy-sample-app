#!/bin/bash

BASEDIR=$(dirname "$0")

## call the variables script.
. $BASEDIR/init.sh

pm2 stop -s $DEPLOY_APP

exit 0
