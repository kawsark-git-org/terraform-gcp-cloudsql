variable "gcp_credentials" {
  description = "GCP credentials needed by Google Terraform provider"
}

variable "gcp_project" {
  description = "GCP project name needed by Google Terraform provider"
}

variable "region" {
  default = "us-central1"
}

variable "gcp_sql_root_user_pw" {}

variable "authorized_network" {}

module "prod-gcp-cloudsql" {
  gcp_credentials = "${var.gcp_credentials}"
  source = "github.com/kawsark-git-org/terraform-gcp-cloudsql"
  region  = "${var.region}"
  database_name_prefix = "prod-cloudsql"
  gcp_sql_root_user_pw = "${var.gcp_sql_root_user_pw}"
  authorized_network = "${var.authorized_network}"
}

module "dev-gcp-cloudsql" {
  gcp_credentials = "${var.gcp_credentials}"
  source = "github.com/kawsark-git-org/terraform-gcp-cloudsql"
  region  = "${var.region}"
  database_name_prefix = "dev-cloudsql"
  gcp_sql_root_user_pw = "${var.gcp_sql_root_user_pw}"
  authorized_network = "${var.authorized_network}"
}
