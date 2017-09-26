provider "google" {
  project = "${var.project}"
  region  = "${var.region}"
}

module "app" {
  source            = "../modules/app"
  public_key_path   = "${var.public_key_path}"
  app_disk_image    = "${var.app_disk_image}"
  user_name         = "${var.user_name}"
  app_instance_name = "${var.app_instance_name}"
  app_machine_type  = "${var.app_machine_type}"
  app_zone          = "${var.app_zone}"
  app_tags          = "${var.app_tags}"
}

module "db" {
  source           = "../modules/db"
  public_key_path  = "${var.public_key_path}"
  db_disk_image    = "${var.db_disk_image}"
  user_name        = "${var.user_name}"
  db_instance_name = "${var.db_instance_name}"
  db_machine_type  = "${var.db_machine_type}"
  db_zone          = "${var.db_zone}"
  db_tags          = "${var.db_tags}"
  app_tags         = "${var.app_tags}"
}

module "vpc" {
  source        = "../modules/vpc"
  source_ranges = ["0.0.0.0/0"]
}
