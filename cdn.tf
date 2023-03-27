provider "google" {
  project = "your-project-id"
  region  = "us-central1"
}

resource "google_compute_network" "my-network" {
  name                    = "my-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "my-subnet" {
  name          = "my-subnet"
  ip_cidr_range = "10.0.0.0/24"
  network      = google_compute_network.my-network.self_link
}

resource "google_compute_firewall" "allow-http" {
  name    = "allow-http"
  network = google_compute_network.my-network.self_link

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
}
