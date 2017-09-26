variable project {
  description = "Project ID"
}

variable region {
  description = "Region"
  default     = "europe-west1"
}

variable public_key_path {
  description = "Path to the public key used for ssh access"
}

variable private_key_path {
  description = "Path to the private key used for ssh access"
}

variable user_name {
  description = "User name"
}

variable disk_image {
  description = "Disk image"
}

variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}

variable db_disk_image {
  description = "Disk image for reddit db"
  default     = "reddit-db-base"
}

variable app_instance_name {
  description = "Reddit-app instance name"
  default     = "reddit-app"
}

variable app_machine_type {
  description = "Reddit-app machine type"
  default     = "g1-small"
}

variable app_zone {
  description = "Reddit-app zone"
  default     = "europe-west1-b"
}

variable app_tags {
  description = "Reddit-app tags"
  default     = ["reddit-app"]
}

variable db_instance_name {
  description = "Reddit-db instance name"
  default     = "reddit-db"
}

variable db_machine_type {
  description = "Reddit-db machine type"
  default     = "g1-small"
}

variable db_zone {
  description = "Reddit-db zone"
  default     = "europe-west1-b"
}

variable db_tags {
  description = "Reddit-db tags"
  default     = ["reddit-db"]
}

variable bucket_name {
  description = "Stage infra bucket name"
}
