

provider "google" {
  credentials = var.GOOGLE_CREDENTIALS

  project = var.GCP_PROJECT_ID
  region  = var.region
  zone    = var.zone
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}