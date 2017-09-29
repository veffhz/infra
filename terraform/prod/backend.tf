terraform {
  backend "gcs" {}
}

resource "google_storage_bucket" "bucket" {
  name          = "${var.bucket_name}-${var.env}"
  location      = "EU"
  force_destroy = true
}
