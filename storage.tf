# create bucker for logging
resource "google_storage_bucket" "logs" {
  name = "logs-bucket"
  location = "US"
  storage_class = "NEARLINE" # 30 day minimum storage duration
    }

# create bucket for coldline storage
resource "google_storage_bucket" "cold" {
  name     = "cold-bucket" 
  location = "US"
  storage_class = "COLDLINE"
}

# create bucket for csv file
resource "google_storage_bucket" "csv-storage" {
  name = "csv-bucket"
  location = "US"
  matches_storage_class = "STANDARD" # best for accessing data frequently
}