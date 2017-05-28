#!/bin/bash

## you may need to include the path for your nodejs installation
PATH="/usr/local/bin:$PATH"

## Node runtime env
NODE_ENV=production

## web server deploy user name, for AWS default is ec2-user. You may set the one is appropriate with your deployment
DEPLOY_USER=ec2-user

## app name on server disk
DEPLOY_APP=my-app

## app path on server disk
DEPLOY_APP_HOME=/home/$DEPLOY_USER/$DEPLOY_APP
