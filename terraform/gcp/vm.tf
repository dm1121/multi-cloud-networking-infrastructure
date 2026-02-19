# terraform/gcp/vm.tf
# Simple public Compute Engine VM for testing connectivity (SSH + ping)

resource "google_compute_instance" "demo_public" {
  name         = "${var.environment}-gcp-demo-vm"
  machine_type = "e2-micro"   # free tier eligible in most regions
  zone         = "${var.gcp_region}-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.public.id

    access_config {
      # Ephemeral public IP
    }
  }

  metadata = {
    # Optional: startup script to install tools or show IP
    startup-script = <<-EOF
      #!/bin/bash
      apt-get update
      apt-get install -y net-tools curl
      echo "GCP demo VM started at $(date)" > /etc/motd
    EOF
  }

  tags = ["demo-public"]   # matches the firewall rule target_tags

  allow_stopping_for_update = true

  labels = {
    environment = var.environment
  }
}

# Output the public IP so you can SSH/ping it
output "gcp_demo_vm_public_ip" {
  description = "Public IP of the GCP demo VM"
  value       = google_compute_instance.demo_public.network_interface[0].access_config[0].nat_ip
}

output "gcp_demo_vm_ssh_command" {
  description = "SSH command to connect to the demo VM"
  value       = "ssh -i ~/.ssh/your-key debian@${google_compute_instance.demo_public.network_interface[0].access_config[0].nat_ip}"
}
