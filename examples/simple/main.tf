variable "gcp_credentials" {
  description = "GCP credentials needed by google provider"
}

variable "database_name" {
  description = "Name of the Cloud SQL instance"
  default = "example-gcp-cloudsql"
}

variable "region" {
  default = "us-central1"
}

variable "gcp_sql_root_user_pw" {}

variable "authorized_network" {}

module "example-gcp-cloudsql" {
  gcp_credentials = "${var.gcp_credentials}"
  source = "github.com/kawsark-git-org/terraform-gcp-cloudsql"
  region  = "${var.region}"
  database_name = "${var.database_name}"
  gcp_sql_root_user_pw = "${var.gcp_sql_root_user_pw}"
  authorized_network = "${var.authorized_network}"
}

