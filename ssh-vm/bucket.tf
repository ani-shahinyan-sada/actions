resource "google_storage_bucket" "auto-expire" {
  name          = "bucket-jan-akhpers"
  location      = "US"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 3
    }
    action {
      type = "Delete"
    }
  }

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}


##
resource "google_storage_bucket_object" "picture" {
  name       = "docker-compose"
  source     = "docker-compose.yaml"
  bucket     = "bucket-jan-akhpers"
  depends_on = [google_storage_bucket.auto-expire]
}
