provider "google"{
region      = "us-central1"
 zone        = "us-central1-c"
}

resource "random_uuid" "test" { }

resource "google_storage_bucket" "auto-expire" {
  name          = "${random_uuid.test.result}-expiring-bucket"
  location      = "US"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = "3"
    }
    action {
      type = "Delete"
    }
  }
}
