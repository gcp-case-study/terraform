provider "google" {
  version = "~> 2.13"
}

data "google_project" "current" {}

data "google_compute_default_service_account" "default" {}