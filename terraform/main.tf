

provider "google" {
  credentials = var.GOOGLE_CREDENTIALS

  project = var.GCP_PROJECT_ID
  region  = var.region
  zone    = var.zone
}
resource "google_cloud_run_v2_service" "mla-service" {
  name     = "mla-service"
  location = "us-central1"
  ingress = "INGRESS_TRAFFIC_ALL"

  template {
    containers {
      image = "gcr.io/${var.GCP_PROJECT_ID }/${var.MLA_SERVICE_IMAGE}"
    ports {
            container_port = 8080
          }   
      }
  }
}



resource "google_cloud_run_v2_service" "iccng-front" {
  name     = "iccng-service"
  location = "us-central1"
  ingress = "INGRESS_TRAFFIC_ALL"

  template {
    containers {
      image = "gcr.io/${var.GCP_PROJECT_ID }/${var.ICCNG}"
    ports {
            container_port = 80
          }   

    env {
          name  = "mla_service_url"
          value = google_cloud_run_v2_service.mla-service.uri
        }
      }

  }
}


resource "google_cloud_run_service_iam_member" "mla-service" {
  location = google_cloud_run_v2_service.mla-service.location
  service  = google_cloud_run_v2_service.mla-service.name
  role     = "roles/run.invoker"
  member   = "allUsers"
}


resource "google_cloud_run_service_iam_member" "iccng-front" {
  location = google_cloud_run_v2_service.iccng-front.location
  service  = google_cloud_run_v2_service.iccng-front.name
  role     = "roles/run.invoker"
  member   = "allUsers"
}

output "iccng-front-url" {
  value = google_cloud_run_v2_service.iccng-front.uri
}

output "back-url" {
  value = google_cloud_run_v2_service.mla-service.uri
}


