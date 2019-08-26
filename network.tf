#Creating the Network
resource "google_compute_network" "vpc_network" {
  name = "vpc-network"
}

#Creating The Subnet
resource "google_compute_subnetwork" "network-with-private-secondary-ip-ranges" {
  name          = "test-subnetwork"
  ip_cidr_range = "10.2.0.0/16"
  region        = "us-central1"
  network       = "${google_compute_network.custom-test.self_link}"
  secondary_ip_range {
    range_name    = "tf-test-secondary-range-update1"
    ip_cidr_range = "192.168.10.0/24"
  }
}

resource "google_compute_network" "custom-test" {
  name                    = "test-network"
  auto_create_subnetworks = false
}

#Enabling peering
resource "google_compute_network_peering" "peering1" {
  name = "peering1"
  network = "${google_compute_network.default.self_link}"
  peer_network = "${google_compute_network.other.self_link}"
}

resource "google_compute_network_peering" "peering2" {
  name = "peering2"
  network = "${google_compute_network.other.self_link}"
  peer_network = "${google_compute_network.default.self_link}"
}

resource "google_compute_network" "default" {
  name                    = "foobar"
  auto_create_subnetworks = "false"
}

resource "google_compute_network" "other" {
  name                    = "other"
  auto_create_subnetworks = "false"
}