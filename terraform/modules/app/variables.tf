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
