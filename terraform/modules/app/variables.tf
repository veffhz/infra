variable public_key_path {
  description = "Path to the public key used to connect to instance"
}

variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}

variable user_name {
  description = "User name"
  default     = "appuser"
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
