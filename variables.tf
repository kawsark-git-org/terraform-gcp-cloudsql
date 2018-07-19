variable "gcp_project_name" {}

variable "gcp_sql_root_user_name" {
	 default = "root"
}
variable "gcp_sql_root_user_pw" {}

variable "region"{
  default = "us-central1"
}

variable "authorized_network"{}

