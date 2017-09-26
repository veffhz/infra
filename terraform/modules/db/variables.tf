variable public_key_path {
  description = "Path to the public key used to connect to instance"
}

variable db_disk_image {
  description = "Disk image for reddit db"
  default     = "reddit-db-base"
}

variable user_name {
  description = "User name"
  default     = "appuser"
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

variable app_tags {
  description = "Reddit-app tags"
  default     = ["reddit-app"]
}
