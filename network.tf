#Creating the East Network
resource "google_compute_network" "east-vnet" {
  name = "east-vnet"
}
#Creating The East Subnets
resource "google_compute_subnetwork" "us-east-subnet-one" {
  name          = "east-digest"
  ip_cidr_range = "10.2.0.0/16"
  region        = "us-east1"
  network       = "${google_compute_network.east-vnet}"
  secondary_ip_range {
    range_name    = "us-east-digest-secondary"
    ip_cidr_range = "192.168.10.0/24"
  }
}
resource "google_compute_subnetwork" "us-east-subnet-two" {
  name          = "east-reporting"
  ip_cidr_range = "10.2.0.0/20"
  region        = "us-east1"
  network       = "${google_compute_network.east-vnet}"
  secondary_ip_range {
    range_name    = "us-east-reporting-secondary"
    ip_cidr_range = "192.168.10.0/26"
  }
}
resource "google_compute_subnetwork" "us-east-subnet-three" {
  name          = "east-storage"
  ip_cidr_range = "10.2.0.0/24"
  region        = "us-east1"
  network       = "${google_compute_network.east-vnet}"
  secondary_ip_range {
    range_name    = "us-east-storage-secondary"
    ip_cidr_range = "192.168.10.0/28"
  }
}

#Creating the Midwest Network
resource "google_compute_network" "midwest-vnet" {
  name = "midwest-vnet"
}
#Creating The West Subnet
resource "google_compute_subnetwork" "us-midwest-subnet-one" {
  name          = "midwest-digest"
  ip_cidr_range = "10.0.0.0/16"
  region        = "us-central1"
  network       = "${google_compute_network.midwest-vnet}"
  secondary_ip_range {
    range_name    = "us-midwest-digest-secondary"
    ip_cidr_range = "192.120.10.0/24"
  }
}
resource "google_compute_subnetwork" "us-midwest-subnet-two" {
  name          = "midwest-reporting"
  ip_cidr_range = "10.0.0.0/20"
  region        = "us-central1"
  network       = "${google_compute_network.midwest-vnet}"
  secondary_ip_range {
    range_name    = "us-midwest-reporting-secondary"
    ip_cidr_range = "192.120.10.0/26"
  }
}
resource "google_compute_subnetwork" "us-midwest-subnet-three" {
  name          = "midwest-storage"
  ip_cidr_range = "10.0.0.0/24"
  region        = "us-central1"
  network       = "${google_compute_network.midwest-vnet}"
  secondary_ip_range {
    range_name    = "us-midwest-storage-secondary"
    ip_cidr_range = "192.120.10.0/28"
  }
}

#Enabling peering
resource "google_compute_network_peering" "region-peering" {
  name = "region-peering"
  network = "${google_compute_network.east-vnet.east}"
  peer_network = "${google_compute_network.midwest-vnet}"
}



