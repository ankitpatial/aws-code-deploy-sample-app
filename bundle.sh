#!/bin/bash

## awscli profile name
profile=ankit

## App name on aws code-deploy
app_name=Test
## Stage on aws code-deploy
stage=$1

## build settings
build_dir=./build
build_version=`date +"%Y-%m-%d-%H%M%S"`

## We need a S3 bucket to upload a new build
bucket="deploy.ankitpatial.com"
key=$app_name/$stage/$build_version.zip

## Remove the old build dir(if exists) and create the new one.
rm -rf $build_dir
mkdir -p $build_dir

## Copy the required files to build dir.
echo "==> copy files to $build_dir"

cp -R ./app $build_dir
cp -R ./deploy $build_dir
cp -R ./config $build_dir

## appspec.yml need to be in root dir
cp ./appspec.yml $build_dir
cp ./yarn.lock $build_dir
cp ./package.json $build_dir
cp ./README.md $build_dir

## Time to upload the code revision.
## Make sure you have awscli installed and configured
## better is you make use profiles. Profile in use must be configure to do code deploy
echo "==> submit a new code-revision s3://$bucket/$key"
aws --profile $profile deploy push \
  --no-ignore-hidden-files \
  --application-name $app_name \
  --s3-location s3://$bucket/$key \
  --source $build_dir


## By now new code revision is upload to S3, its time to call the code deploy
echo "==> initiate code-deploy for $key"
aws --profile $profile deploy create-deployment \
  --application-name $app_name \
  --deployment-config-name CodeDeployDefault.OneAtATime \
  --deployment-group-name $stage \
  --s3-location bundleType=zip,bucket=$bucket,key=$key

## Make sure we remove the build dir
rm -rf $build_dir


