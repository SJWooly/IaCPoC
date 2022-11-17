resource "aws_vpc" "this" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  instance_tenancy     = "default"
}

resource "aws_subnet" "this" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
}


resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id
}

resource "aws_route" "this" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this.id
  depends_on = [
    aws_route_table.public
  ]
}

resource "aws_route_table_association" "ig_routes_to_public_sn" {
  subnet_id      = aws_subnet.this.id
  route_table_id = aws_route_table.public.id
  depends_on = [
    aws_subnet.this,
    aws_route_table.public
  ]
}

resource "aws_security_group" "tls_http" {
  vpc_id = aws_vpc.this.id

  ingress {
    description = "TLS from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.this.cidr_block] #@TODO refine to just sn once tested
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" #ie all
    cidr_blocks = ["0.0.0.0/0"]
  }
}
