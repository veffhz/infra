resource "google_compute_instance" "db" {
  name = "${var.db_instance_name}"
  machine_type  = "${var.db_machine_type}"
  zone          = "${var.db_zone}"
  tags          = "${var.db_tags}"

  # определение загрузочного диска
  boot_disk {
    initialize_params {
      image = "${var.db_disk_image}"
    }
  }

  # определение сетевого интерфейса
  network_interface {
    # сеть, к которой присоединить данный интерфейс
    network = "default"

    # использовать ephemeral IP для доступа из Интернет
    access_config {}
  }

  metadata {
    sshKeys = "${var.user_name}:${file(var.public_key_path)}"
  }
}

resource "google_compute_firewall" "firewall_mongo" {
  name    = "allow-mongo-default"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["27017"]
  }

  target_tags = "${var.db_tags}"
  source_tags = "${var.app_tags}"
}
