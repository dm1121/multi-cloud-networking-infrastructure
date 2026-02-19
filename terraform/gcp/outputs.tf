# terraform/gcp/outputs.tf

output "gcp_region_used" {
  description = "The GCP region configured for this deployment"
  value       = var.gcp_region
}

output "gcp_network_id" {
  description = "ID (self-link) of the created GCP VPC network"
  value       = google_compute_network.main.id
}

output "gcp_network_name" {
  description = "Name of the created GCP VPC network"
  value       = google_compute_network.main.name
}

output "gcp_network_self_link" {
  description = "Self-link of the GCP VPC network (useful for peering)"
  value       = google_compute_network.main.self_link
}

output "gcp_public_subnet_id" {
  description = "ID (self-link) of the public subnetwork"
  value       = google_compute_subnetwork.public.id
}

output "gcp_public_subnet_cidr" {
  description = "CIDR range of the public subnetwork"
  value       = google_compute_subnetwork.public.ip_cidr_range
}

output "gcp_public_subnet_region" {
  description = "Region where the public subnetwork is created"
  value       = google_compute_subnetwork.public.region
}
