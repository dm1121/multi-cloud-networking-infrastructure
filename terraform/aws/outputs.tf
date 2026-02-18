# terraform/aws/outputs.tf

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
  value       = aws_subnet.public.id   # adjust name if your subnet resource is named differently
}

output "aws_public_subnet_cidr" {
  description = "CIDR block of the public subnet"
  value       = aws_subnet.public.cidr_block
}
