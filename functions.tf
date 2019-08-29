resource "google_cloudfunctions_function" "function-IoT" {
  name                  = "function-IoT"
  description           = "Digest function for clien ABD"
  runtime               = "nodejs10"

  available_memory_mb   = 128
  source_archive_bucket = "${google_storage_bucket.bucket.name}"
  source_archive_object = "${google_storage_bucket_object.archive.name}"
  trigger_http          = true
  timeout               = 60
  entry_point           = "index.js"
  labels = {
    my-label = "my-lab"
  }

  //environment_variables = {
    //MY_ENV_VAR = "my-env-var-value"
  //}
}