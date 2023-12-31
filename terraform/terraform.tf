terraform {
    cloud {
    organization = "ICC_CHURCH"

    workspaces {
      name = "icc_application"
    }
  }


  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }

  required_version = "~> 1.2" 
}
