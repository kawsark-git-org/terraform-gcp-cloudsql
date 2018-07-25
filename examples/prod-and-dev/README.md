# terraform-gcp-cloudsql
Provisions 2 GCP CloudSQL POSTGRES instances in GCP for demo purposes using `terraform-gcp-cloudsql` module

Please the following environment variables appropriately:
```
export GOOGLE_CLOUD_KEYFILE_JSON=<path/to/keyfile>
export GOOGLE_PROJECT=<project>
export TF_VAR_gcp_sql_root_user_pw=<pw>
export TF_VAR_authorized_network="$(curl whatismyip.akamai.com)/32"
```
Run the terraform commands below to create the sql instance:  
```
terraform get --update=true
terraform init
terraform plan
terraform apply
```
View module outputs:
```
terraform output -json -module=prod-gcp-cloudsql | jq .
terraform output -json -module=dev-gcp-cloudsql | jq .
```
Connect using psql CLI:
```
terraform output -json -module=prod-gcp-cloudsql | jq -r .ip.value > /tmp/prod-sql-ip
terraform output -json -module=dev-gcp-cloudsql | jq -r .ip.value > /tmp/dev-sql-ip
psql "sslmode=disable dbname=postgres user=root hostaddr=$(cat /tmp/prod-sql-ip)"
psql "sslmode=disable dbname=postgres user=root hostaddr=$(cat /tmp/dev-sql-ip)"
```
