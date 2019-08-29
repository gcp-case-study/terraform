#East Database
resource "google_compute_instance" "compute-db-east" {
  name         = "database-east-vm"
  machine_type = "n1-standard-1"
  zone         = "us-east1-a"

  tags = ["foo", "bar"]

  project = "project"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  // Local SSD disk
  scratch_disk {
  }

  network_interface {
    network = "${google_compute_network.east-vnet}"
  }

  metadata = {
    foo = "bar"
  }

  metadata_startup_script = "${file("startup.sh")}"

}

#Midwest Database
resource "google_compute_instance" "compute-db-midwest" {
  name         = "database-midwest-vm"
  machine_type = "n1-standard-1"
  zone         = "us-central1-b"

  tags = ["foo", "bar"]

  project = "project"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  // Local SSD disk
  scratch_disk {
  }

  network_interface {
    network = "${google_compute_network.midwest-vnet-vnet}"
  }

  metadata = {
    foo = "bar"
  }

  metadata_startup_script = "${file("startup.sh")}"

}
