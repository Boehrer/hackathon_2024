variable "project_id" {
  description = "The project ID to deploy resources into"
  type        = string
  default     = "concise-perigee-228117"
}

variable "compute_instance_name" {
    type = string
    default = "mqtt-broker"
}

variable "zone" {
  description = "The GCP zone to deploy instances into"
  type        = string
  default     = "us-central1-c"
}

variable "cos_image_name" {
  description = "The forced COS image to use instead of latest"
  type        = string
  default     = "cos-stable-77-12371-89-0"
}
