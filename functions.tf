#IoT Function
resource "google_cloudfunctions_function" "function-IoT" {
  name                  = "function-IoT"
  description           = "IoT function for clien ABD"
  runtime               = "nodejs10"

  available_memory_mb   = 512
  source_archive_bucket = "${google_storage_bucket.bucket.name}"
  source_archive_object = "${google_storage_bucket_object.archive.name}"
  trigger_http          = true
  timeout               = 60
  entry_point           = "indexIoT.js"
  labels = {
    my-label = "my-IoT"
  }
}

#
resource "google_cloudfunctions_function" "function-pubsub" {
  name                  = "function-pubsub"
  description           = "Pub/Sub function for clien ABD"
  runtime               = "nodejs10"

  available_memory_mb   = 128
  source_archive_bucket = "${google_storage_bucket.bucket.name}"
  source_archive_object = "${google_storage_bucket_object.archive.name}"
  trigger_http          = true
  timeout               = 60
  entry_point           = "indexpubsub.js"
  labels = {
    my-label = "my-pub/sub"
  }
}

