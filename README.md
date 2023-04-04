# Setup

# Create a new repository and choose this as the template repository

# In order to set up the project, the terraform backend must be initialized.

# Download aws cli
- Make sure you have the aws cli installed on your machine. If not, you can download it from [here](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html).
- Make sure you have the aws cli configured on your machine. If not, you can configure it with the following command:
  - `aws configure`
  - If you don't have an access and secret key, go to the [IAM console](https://console.aws.amazon.com/iam/home?region=us-east-1#/users) and create a new user. Then, attach the `AdministratorAccess` policy to the user. After that, you can generate the access and secret key for the user.`
  - Authenticate the user and make sure to remember the profile name.

# Download terraform
- Make sure you have the terraform cli installed on your machine. If not, you can download it from [here](https://www.terraform.io/downloads.html).

# Modify the configuration files
- Go to the ./infrastructure/tf_backend directory and modify the `config.tfvars` file according to your needs.

# Create the backend
- In cmd cd to the ./infrastrucutre/tf_backend directory and run the following commands:
  - `terraform init`
  - `terraform plan var-file="./config.tfvars"`
  - `terraform apply -auto-approve var-file="./config.tfvars"`

# Add repo secrets and variables
- Open the newly created repository and go to the `Settings` tab.
- Go to the `Secrets and variables` tab and open `Actions`
- For secrets, create New repository secrets
  - Add `PULL_KEY_REPO` with the value of a github access token generated from an account that has access to that reposotory.
  - Add `AWS_ACCESS_KEY_ID` with the value of the access key of the user you created in the previous step.
  - Add `AWS_SECRET_ACCESS_KEY` with the value of the secret key of the user you created in the previous step.
  - When available, issue a certificate for the domain name of the webapp and add `AWS_CERTIFICATE_ARN` with the value of the certificate arn. A certificate can be issued from the [AWS Certificate Manager](https://console.aws.amazon.com/acm/home?region=us-east-1#/) by clicking on `General` tab and then `Edit` and then `Request a certificate` when browsing the created cloudfront distribution.
- Click on the `Variables` tab and `New repository variable`
  - Add `AWS_REGION` with the value of the region this webapp should be deployed -> Make sure it is the same region used for the backend and for the infrastructure. For Frankfurt, it is `eu-central-1`.
  - Add `APP_NAME` with the value of the name of the webapp.
  - When available, add `DOMAIN_NAME` with the value of the domain name of the webapp.
  
# You are all set! Now you can start working on the angular project.

# Pipeline
- Any changes on the source-code will trigger the pipeline.
- This will result in automatic rebuild of the angular project and the creation of an invalidation.
- The changes should be visible once the pipeline ends.