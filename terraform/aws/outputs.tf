output "aws_region_used" {
  description = "The AWS region configured for this deployment"
  value       = var.aws_region
}

output "aws_vpc_id" {
  description = "ID of the created AWS VPC"
  value       = aws_vpc.main.id
}

output "aws_vpc_cidr_block" {
  description = "CIDR block of the AWS VPC"
  value       = aws_vpc.main.cidr_block
}

output "aws_public_subnet_id" {
  description = "ID of the public subnet"
  value       = aws_subnet.public.id
}

output "aws_public_subnet_cidr" {
  description = "CIDR block of the public subnet"
  value       = aws_subnet.public.cidr_block
}

output "aws_subnet_availability_zone" {
  description = "Availability Zone where the public subnet is created"
  value       = aws_subnet.public.availability_zone
}

output "aws_public_subnet_map_public_ip" {
  description = "Whether instances get public IPs by default in this subnet"
  value       = aws_subnet.public.map_public_ip_on_launch
}

output "aws_internet_gateway_id" {
  description = "ID of the Internet Gateway attached to the VPC"
  value       = aws_internet_gateway.igw.id
}
# ──────────────────────────────────────────────────────────────
# Basic demo security group: SSH + ICMP inbound, all outbound
# WARNING: very permissive – only for learning/demo environment
# ──────────────────────────────────────────────────────────────

resource "aws_security_group" "demo_public" {
  name        = "${var.environment}-aws-demo-public-sg"
  description = "Demo: SSH + ICMP inbound from anywhere, all outbound"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "SSH from anywhere (demo only)"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "ICMP (ping) from anywhere (demo only)"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.environment}-aws-demo-sg"
    Environment = var.environment
  }
}
