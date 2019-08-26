resource "google_compute_firewall" "default" {

    name    = "firewall-bpc"
    network = "default"

    allow {
      protocol = "https"
      ports    = ["80"]
    }
}