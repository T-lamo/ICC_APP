

variable "zone" {
  description = "GCP region"
  default     = ""
}

variable "region" {
  description = "GCP region"
  default     = "us-central1"
}

variable "machine_type" {
  description = "Type of instance to provision"
  default     = "e2-standard-2"
}

variable "machine_name" {
  description = "instance name"
  default     = "instance_tf"
}

variable "GCP_PROJECT_ID" {
  description = ""
  default     = ""
}

variable "GOOGLE_CREDENTIALS" {
  description = ""
  default     = ""
}

variable "GCP_SA_EMAIL" {
  description = ""
  default     = ""
}