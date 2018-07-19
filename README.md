# terraform-gcp-cloudsql
Provisions Cloud SQL instances in GCP

This mnodule will create a Google cloud SQL POSTGRES_9_6 instance
Set the following environment variables appropriately:
```
export GOOGLE_CLOUD_KEYFILE_JSON=<path/to/keyfile>
export TF_VAR_gcp_project_name=<project>
export TF_VAR_gcp_sql_root_user_pw=<pw>
```
Run the terraform commands below to create the sql instance:  
```
terraform get --update=true
terraform init
terraform plan
terraform apply
```
