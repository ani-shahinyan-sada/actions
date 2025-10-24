resource "google_storage_bucket" "auto-expire" {
  name          = "bucket-jan-akhpers"
  location      = "US"
  force_destroy = true

  uniform_bucket_level_access = true
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


###
resource "google_storage_bucket_object" "docker_compose" {
  name       = "docker-compose.yaml"
  source     = "docker-compose.yaml"
  bucket     = google_storage_bucket.auto-expire.name
  depends_on = [google_storage_bucket.auto-expire]
}

resource "google_storage_bucket_object" "prometheus_config" {
  name       = "prometheus.yml"
  source     = "../prometheus/prometheus-config/prometheus.yml"
  bucket     = google_storage_bucket.auto-expire.name
  depends_on = [google_storage_bucket.auto-expire]
}

resource "google_storage_bucket_object" "grafana_datasources" {
  name       = "datasources.yml"
  source     = "../grafana/datasources.yml"
  bucket     = google_storage_bucket.auto-expire.name
  depends_on = [google_storage_bucket.auto-expire]
}
