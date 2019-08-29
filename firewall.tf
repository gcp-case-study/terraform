resource "google_compute_firewall" "east" {
  name    = "east-firewall"
  network = "${google_compute_network.east-vnet}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "https"
    ports    = ["443"]
  }
  allow {
    protocol = "http"
    ports    = ["80"]
  }
  allow {
    protocol = "ssh"
    ports    = ["22"]
  }

  source_tags = ["web"]
}
resource "google_compute_firewall" "midwest" {
  name    = "midwest-firewall"
  network = "${google_compute_network.midwest-vnet}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "https"
    ports    = ["443"]
  }
  allow {
    protocol = "http"
    ports    = ["80"]
  }
  allow {
    protocol = "ssh"
    ports    = ["22"]
  }
  source_tags = ["web"]
}



