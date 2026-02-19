resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.environment}-aws-igw"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.environment}-aws-public-rt"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
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
