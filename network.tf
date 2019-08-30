#Creating the East Network
resource "google_compute_network" "eastvnet" {
  name    = "abceast-network"
  project = "mc-sheer"
}
#Creating The East Subnets
resource "google_compute_subnetwork" "us-east-subnet-one" {
  name          = "abceast-digest"
  ip_cidr_range = "10.2.0.0/24"
  region        = "us-east1"
  network       = "${google_compute_network.eastvnet.self_link}"
  secondary_ip_range {
    range_name    = "us-east-digest-secondary"
    ip_cidr_range = "192.168.10.0/24"
  }
}
resource "google_compute_subnetwork" "us-east-subnet-two" {
  name          = "abceast-reporting"
  ip_cidr_range = "10.3.6.0/24"
  region        = "us-east1"
  network       = "${google_compute_network.eastvnet.self_link}"
  secondary_ip_range {
    range_name    = "us-east-reporting-secondary"
    ip_cidr_range = "192.168.15.0/24"
  }
}
resource "google_compute_subnetwork" "us-east-subnet-three" {
  name          = "abceast-storage"
  ip_cidr_range = "10.4.8.0/24"
  region        = "us-east1"
  network       = "${google_compute_network.eastvnet.self_link}"
  secondary_ip_range {
    range_name    = "us-east-storage-secondary"
    ip_cidr_range = "192.168.20.0/24"
  }
}
#Firewall rule for East VPC
resource "google_compute_firewall" "east-vpc" {
  name    = "abceast-firewall"
  network = "${google_compute_network.eastvnet.self_link}"

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443", "3389"]
  }
}
#Creating the Midwest Network
resource "google_compute_network" "midwestvnet" {
  name    = "abcmidwest-network"
  project = "mc-sheer"
}
#Creating The West Subnets
resource "google_compute_subnetwork" "us-midwest-subnet-one" {
  name          = "abcmidwest-digest"
  ip_cidr_range = "10.6.12.0/24"
  region        = "us-central1"
  network       = "${google_compute_network.midwestvnet.self_link}"
  secondary_ip_range {
    range_name    = "us-midwest-digest-secondary"
    ip_cidr_range = "192.168.25.0/24"
  }
}
resource "google_compute_subnetwork" "us-midwest-subnet-two" {
  name          = "abcmidwest-reporting"
  ip_cidr_range = "10.12.24.0/24"
  region        = "us-central1"
  network       = "${google_compute_network.midwestvnet.self_link}"
  secondary_ip_range {
    range_name    = "us-midwest-reporting-secondary"
    ip_cidr_range = "192.168.30.0/24"
  }
}
resource "google_compute_subnetwork" "us-midwest-subnet-three" {
  name          = "abcmidwest-storage"
  ip_cidr_range = "10.24.36.0/24"
  region        = "us-central1"
  network       = "${google_compute_network.midwestvnet.self_link}"
  secondary_ip_range {
    range_name    = "us-midwest-storage-secondary"
    ip_cidr_range = "192.168.35.0/24"
  }
}
#Firewall rule for Midwest VPC
resource "google_compute_firewall" "midwest-vpc" {
  name    = "abcmidwest-firewall"
  network = "${google_compute_network.midwestvnet.self_link}"
  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443", "3389"]
  }
}
#Enabling peering for VPC's
resource "google_compute_network_peering" "vnet-peering" {
  name         = "abcvnet-peering"
  network      = "${google_compute_network.eastvnet.self_link}"
  peer_network = "${google_compute_network.midwestvnet.self_link}"
}
#East Database
resource "google_compute_instance" "compute-db-east" {
  name         = "abcdatabase-east-vm"
  machine_type = "n1-standard-1"
  zone         = "us-east1-b"

  tags = ["foo", "bar"]

  project = "mc-sheer"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  // Local SSD disk
  scratch_disk {
  }

  network_interface {
    network = "${google_compute_network.eastvnet.self_link}"
  }

  metadata = {
    foo = "bar"
  }

  metadata_startup_script = "${file("startup.sh")}"

}
#Midwest Database
resource "google_compute_instance" "compute-db-midwest" {
  name         = "abcdatabase-midwest-vm"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  tags = ["foo", "bar"]

  project = "mc-sheer"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  // Local SSD disk
  scratch_disk {
  }

  network_interface {
    network = "${google_compute_network.midwestvnet.self_link}"
  }

  metadata = {
    foo = "bar"
  }

  metadata_startup_script = "${file("startup.sh")}"
}
