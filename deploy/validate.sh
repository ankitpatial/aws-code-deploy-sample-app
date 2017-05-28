#!/bin/bash

BASEDIR=$(dirname "$0")

## call the variables script.
. $BASEDIR/init.sh

res=`pm2 list | grep $DEPLOY_APP | grep online -m 1 | awk '{print $10}'`

if [ $res ]
then
    exit 0
else
    exit 1
fi

