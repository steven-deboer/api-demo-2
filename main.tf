provider "google" {
  project = "lab-01-396307"
  region  = "europe-west4"
}

resource "google_compute_instance" "vulnerable-vm" {
  name         = "vulnerable-vm"
  machine_type = "e2-medium"
  zone         = "europe-west4-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network    = "lab-01-vpc"
    subnetwork = "subnet-01"
  }

  // Een kwetsbare configuratie, bijvoorbeeld onveilige firewall-regels
  service_account {
    scopes = ["cloud-platform"]
  }
  tags = ["http-server", "https-server"]
  labels = {
    yor_name             = "vulnerable-vm"
    yor_trace            = "71a29b9f-20dd-40bc-836c-ec03766d0fcd"
    git_commit           = "d7df8eb7623fac9ffaa09ab38ca36a44882e9992"
    git_file             = "main_tf"
    git_last_modified_at = "2023-12-06-14-33-33"
    git_last_modified_by = "stdeboer"
    git_modifiers        = "stdeboer"
    git_org              = "boeronline"
    git_repo             = "api-demo"
  }
}

resource "google_compute_firewall" "vulnerable-firewall" {
  name    = "allow-http-https"
  network = "lab-01-vpc"

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
}
