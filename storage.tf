# create bucket
resource "google_storage_bucket" "image-store" {
  name     = "weet-bucket" # required
  location = "US"
  storage_class = "MULTI_REGIONAL"
  lifecycle_rule {
      action { # required for lifecycle_rule block
          type = "delete or SetStorageClass"
          storage_class = "MULTI_REGIONAL" # required if action = "SetStorageClass"
      }
      condition { # required for lifecycle_rule block
          matches_storage_class = "MULTI_REGIONAL" # at least one element is required for condition
      } 
  }
  website {
    main_page_suffix = "WEBSITE_DOMAIN"
  }
  versioning {
      enabled = "true"
  }     
}