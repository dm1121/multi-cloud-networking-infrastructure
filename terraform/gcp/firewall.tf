# terraform/gcp/firewall.tf
# Basic demo firewall rules: SSH + ICMP inbound, all outbound
# WARNING: very permissive – only for learning/demo environment

resource "google_compute_firewall" "demo_allow_ssh_icmp" {
  name    = "${var.environment}-gcp-allow-ssh-icmp"
  network = google_compute_network.main.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  allow {
    protocol = "icmp"
  }

  source_ranges = ["0.0.0.0/0"]

  target_tags = ["demo-public"]   # optional – can be used to apply only to tagged VMs

  description = "Demo: SSH + ICMP inbound from anywhere"
}

resource "google_compute_firewall" "demo_allow_all_egress" {
  name               = "${var.environment}-gcp-allow-all-egress"
  network            = google_compute_network.main.name
  direction          = "EGRESS"
  priority           = 65534
  destination_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "all"
  }

  description = "Explicit allow all outbound (GCP default is allow, this is for clarity)"
}
