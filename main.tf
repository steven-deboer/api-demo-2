provider "google" {
  project = "jouw-project-id"
  region  = "jouw-regio"
}

resource "google_compute_instance" "kwetsbare-vm" {
  name         = "kwetsbare-vm"
  machine_type = "e2-medium"
  zone         = "jouw-zone"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"
    access_config {
      // Lege access_config section zorgt voor een extern IP-adres
    }
  }

  // Een kwetsbare configuratie, bijvoorbeeld onveilige firewall-regels
  service_account {
    scopes = ["cloud-platform"]
  }
  tags = ["http-server", "https-server"]
}

resource "google_compute_firewall" "kwetsbare-firewall" {
  name    = "allow-http-https"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
}
