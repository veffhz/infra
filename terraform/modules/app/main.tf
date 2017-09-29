########### USE STATIC IP ##############

resource "google_compute_instance" "app_static" {
  name         = "${var.app_instance_name}"
  machine_type = "${var.app_machine_type}"
  zone         = "${var.app_zone}"
  tags         = "${var.app_tags}"
  count        = "${var.ip_resource_enabled}"

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
  count = "${var.ip_resource_enabled}"
  name  = "${var.app_resource_ip_name}"
}

resource "google_compute_firewall" "firewall_puma" {
  name    = "${var.puma_firewall_resource_name}"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["9292"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = "${var.app_tags}"
}

########### DO NOT USE STATIC IP ##############

resource "google_compute_instance" "app_ephemeral" {
  name         = "${var.app_instance_name}"
  machine_type = "${var.app_machine_type}"
  zone         = "${var.app_zone}"
  tags         = "${var.app_tags}"
  count        = "${1 - var.ip_resource_enabled}"

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

    access_config {}
  }

  metadata {
    sshKeys = "${var.user_name}:${file(var.public_key_path)}"
  }
}
