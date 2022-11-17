resource "aws_vpc" "this" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  instance_tenancy     = "default"
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.this.id
  cidr_block = "10.0.2.0/24"
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id
}

resource "aws_route" "public_igw" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this.id
  depends_on = [
    aws_route_table.public
  ]
}

resource "aws_route_table_association" "ig_routes_to_public_sn" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
  depends_on = [
    aws_subnet.public,
    aws_route_table.public
  ]
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.this.id
}

resource "aws_route_table_association" "private_rt_to_sn" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
  depends_on = [
    aws_route_table.private
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

resource "aws_instance" "this" {
  subnet_id              = aws_subnet.private.id
  ami                    = "ami-01cae1550c0adea9c"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.tls_http.id]
}
