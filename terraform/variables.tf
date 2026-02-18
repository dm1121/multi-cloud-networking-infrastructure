variable "environment" {
  description = "Environment prefix (demo, dev, etc.)"
  type        = string
  default     = "demo"
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "azure_location" {
  description = "Azure location"
  type        = string
  default     = "eastus"
}

variable "gcp_region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}

variable "gcp_project_id" {
  description = "Your GCP Project ID"
  type        = string
  # no default — must set in tfvars
}

variable "cidr_prefix" {
  description = "Base CIDR (e.g. 10.100 → 10.100.x.x/xx)"
  type        = string
  default     = "10.100"
}
