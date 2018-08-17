variable "region" {
  default = "us-central1"
}

variable "gcp_sql_root_user_pw" {}

variable "authorized_network" {}

module "example-gcp-cloudsql" {
  source = "github.com/kawsark-git-org/terraform-gcp-cloudsql"
  region  = "${var.region}"
  database_name = "example-gcp-cloudsql"
  gcp_sql_root_user_pw = "${var.gcp_sql_root_user_pw}"
  authorized_network = "${var.authorized_network}"
}

