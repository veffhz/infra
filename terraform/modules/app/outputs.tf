output "app_external_ip" {
  value = "${google_compute_instance.app_static.network_interface.0.access_config.0.assigned_nat_ip}"
}

output "app_ephemeral_ip" {
  value = "${google_compute_instance.app_ephemeral.network_interface.0.access_config.0.assigned_nat_ip}"
}
