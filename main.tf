provider "google"{
project = "vanguard-20200519"
region      = "us-central1"
 zone        = "us-central1-c"
}

resource "google_storage_bucket" "auto-expire" {
  name          = "neos-auto-expiring-bucket"
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
