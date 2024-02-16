terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = "us-central1"
  zone    = "us-central1-c"
  credentials = file("service_account_key.json")
}

module "container" {
  source = "terraform-google-modules/container-vm/google"
  version = "~> 2.0"
  cos_image_name = var.cos_image_name
  container = {
    image = "eclipse-mosquitto:latest"
    command = [
        "mosquitto"
    ]
    args = [
      "-c",
      "/mosquitto-no-auth.conf"
    ]
  }
  restart_policy = "Always"
}

resource "google_compute_firewall" "mqtt-broker-firewall" {
  name    = "mqtt-broker"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["1883"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags = ["mqtt-broker"]
}

resource "google_compute_instance" "broker" {
  project      = var.project_id
  name         = var.compute_instance_name
  machine_type = "e2-micro"
  allow_stopping_for_update = true
  zone         = var.zone
  boot_disk {
    initialize_params {
      image = module.container.source_image
    }
  }
  network_interface {
    network = "default"
    access_config {
    }
  }
  tags = ["mqtt-broker"]
  metadata = {
    gce-container-declaration = module.container.metadata_value
    google-logging-enabled    = "true"
    google-monitoring-enabled = "true"
  }

  labels = {
    container-vm = module.container.vm_container_label
  }

  service_account {
    scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
}
