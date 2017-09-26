resource "google_compute_instance" "app" {
  name = "${var.app_instance_name}"
  machine_type  = "${var.app_machine_type}"
  zone          = "${var.app_zone}"
  tags          = "${var.app_tags}"

  # определение загрузочного диска
  boot_disk {
    initialize_params {
      image = "${var.app_disk_image}"
    }
  }

  # определение сетевого интерфейса
  network_interface {
    # сеть, к которой присоединить данный интерфейс
    network = "default"

    # использовать ephemeral IP для доступа из Интернет
    access_config {
      nat_ip = "${google_compute_address.app_external_ip.address}"
    }
  }

  metadata {
    sshKeys = "${var.user_name}:${file(var.public_key_path)}"
  }
}

resource "google_compute_address" "app_external_ip" {
  name = "reddit-app-ip"
}

resource "google_compute_firewall" "firewall_puma" {
  name    = "allow-puma-default"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["9292"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = "${var.app_tags}"
}
