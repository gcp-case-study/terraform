resource "google_bigquery_dataset" "bigquery" {
  dataset_id                  = "ABD-client"
  friendly_name               = "ABC dataset"
  description                 = "Big Query analytics for Client ABC"
  location                    = "EU"
  default_table_expiration_ms = 3600000

  labels = {
    env = "bigquery"
  }

  access {
    role   = "READER"
    domain = "abd.com"
  }
  access {
    role           = "WRITER"
    group_by_email = "writers@abd.com"
  }
}

