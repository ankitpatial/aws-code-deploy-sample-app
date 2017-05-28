## AWS Code Deploy
This is sample app to demonstrate the aws code deploy feature mentioned in [this blog post](https://www.packtpub.com/books/content/deploy-nodejs-apps-aws-code-deploy#comment-3308175779).

I normally deploy my apps to Amazon Linux EC2 instances. But if you are going to make use of 
some other linux distro then you have to check following files for valid user & group names:
- appspec.yml
- deploy/**
 
### Prerequisites
 - AWS account
 - EC2 instance. For setup details check file ``docs/ec2-setup.sh``. [Can view more details here](http://docs.aws.amazon.com/codedeploy/latest/userguide/instances.html)
 - Code Deploy app with a stage. Read this [official documentation](http://docs.aws.amazon.com/codedeploy/latest/userguide/getting-started-codedeploy.html) to create it.
 - IAM user with following access:
    - Code deploy.
    - Read/Write to the s3 bucket where we will put code revisions.
 
    For more help on IAM setup check file ``docs/IAM-user-setup.txt``
 
 - awscli installed and configure with IAM detail from above step.

## Files that you may need to change.
### appspec.yml
Change the ``files:destination`` as per your desired location on web server.

### bundle.sh
- variable ``app_name`` will be the name of AWS CodeDeploy app you have created.
- variable ``bucket`` will be the name of S3 bucket where you want to keep the code revisions.
- ``aws --profile`` set profile name that has access to deploy the app.
### deploy/init.sh
This file contains variables that other scripts needs. Change them as per your needs.

### How to run the deploy script.
package.json has the cmd mentioned init all you need to do is

``yarn run deploy-prod``

Or

``yarn run deploy-stage``
