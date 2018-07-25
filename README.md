# terraform-gcp-cloudsql
Provisions Cloud SQL instances in GCP

This module will create a Google cloud SQL POSTGRES_9_6 instance.

### Pre-requisites:
- A Google Cloud account and project.
- `Google Cloud SQL` and `Cloud SQL Admin API` APIs must be enabled on the project. This can be enabled on [Google cloud console](https://support.google.com/cloud/answer/6158841?hl=en) or CLI.
- A Google Cloud credentials .json file is required. This can be obtained by generating a [Service Account Key] (https://cloud.google.com/iam/docs/creating-managing-service-account-keys).

### Examples:
- Provisions example Prod and Dev CloudSQL instances: [prod-and-dev](examples/prod-and-dev/README.md)

### Usage:
Set the following environment variables appropriately:
```
export GOOGLE_CLOUD_KEYFILE_JSON=<path/to/keyfile>
export GOOGLE_PROJECT=<project>
export TF_VAR_gcp_sql_root_user_pw=<pw>
export TF_VAR_authorized_network="$(curl whatismyip.akamai.com)/32"
```
Run the terraform commands below to create the sql instance:  
```
terraform init
terraform plan
terraform apply
```
View module outputs:
```
terraform output -json | jq .
```
Connect using psql CLI:
```
terraform output -json | jq -r .ip.value > /tmp/sql-ip
psql "sslmode=disable dbname=postgres user=root hostaddr=$(cat /tmp/sql-ip)"
```
