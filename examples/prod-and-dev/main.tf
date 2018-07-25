variable "region" {
  default = "us-central1"
}

variable "gcp_sql_root_user_pw" {}

variable "authorized_network" {}

module "prod-gcp-cloudsql" {
  source = "../../"
  region  = "${var.region}"
  database_name = "prod-gcp-cloudsql"
  gcp_sql_root_user_pw = "${var.gcp_sql_root_user_pw}"
  authorized_network = "${var.authorized_network}"
}

module "dev-gcp-cloudsql" {
  source = "../../"
  region  = "${var.region}"
  database_name = "dev-gcp-cloudsql"
  gcp_sql_root_user_pw = "${var.gcp_sql_root_user_pw}"
  authorized_network = "${var.authorized_network}"
}
