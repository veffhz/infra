variable source_ranges {
  description = "Allowed IP addresses"
  default     = ["0.0.0.0/0"]
}

variable ssh_firewall_resource_name {
  description = "Name firewall resource for ssh"
}
