provider "google" {
  version = "~> 2.13"
  region = "${var.region}"
}

data "google_project" "current" {}

data "google_compute_default_service_account" "default" {}