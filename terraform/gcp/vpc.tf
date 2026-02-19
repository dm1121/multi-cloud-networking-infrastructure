# terraform/gcp/vpc.tf
# Minimal GCP VPC Network + regional subnetwork (public-style)

resource "google_compute_network" "main" {
  name                    = "${var.environment}-gcp-vpc"
  auto_create_subnetworks = false          # We create custom subnets
  routing_mode            = "GLOBAL"       # Common for multi-region reachability

  description = "Multi-cloud demo VPC in GCP"

  # Optional: delete_default_routes_on_create = true  # Uncomment if you want no default route (more secure, but needs explicit routes)
}

resource "google_compute_subnetwork" "public" {
  name          = "${var.environment}-gcp-public"
  ip_cidr_range = "${var.cidr_prefix}.128.0.0/24"   # e.g., 10.100.128.0.0/24
  region        = var.gcp_region
  network       = google_compute_network.main.id

  # Allow public IPs (default behavior in GCP)
  private_ip_google_access = true   # Allows access to Google APIs/services without public IP

  # Optional: stack_type = "IPV4" (default) or "IPV4_IPV6" if dual-stack needed
}
