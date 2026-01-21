variable "project_id" {
  description = "GCP proyect ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
  default     ="us-central1"
}

variable "zone" {
  description = "GCP zone"
  type        = string
  default     = "us-central1-a"
}

variable "vm_name" {
  description = "DevOps bastion VM name"
  type        = string
  default     = "devops-bastion"
}

variable "machine_type" {
  description = "VM machine type"
  type        = string
  default     = "e2-small"
}