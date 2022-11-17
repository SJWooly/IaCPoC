resource "aws_vpc" "this" {
  cidr_block           = "10.10.0.0/16" # @TODO check what derived default is
  enable_dns_support   = "true"         # @TODO why flag?
  enable_dns_hostnames = "true"         # @TODO why flag?
  # further flags? y/n
}

# @TODO specific cidr ranges or does defaults?
resource "aws_subnet" "public" { # @TODO is public subnet needed if using IG to xyz
  vpc_id     = aws_vpc.this.id
  cidr_block = "10.10.1.0/24"
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.this.id
  cidr_block = "10.10.2.0/24"
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
}

resource "aws_route_table" "this" {
  vpc_id = aws_vpc.this.id
  route  = [] #@TODO pull in from vars
}

resource "aws_route_table_association" "ig_to_public_sn" {
  gateway_id     = aws_internet_gateway.this.id
  route_table_id = aws_route_table.this.id
}

resource "aws_route_table_association" "rt_to_private_sn" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.this.id
}

resource "aws_route" "this" {
  route_table_id              = aws_route_table.this.id
  destination_ipv6_cidr_block = "::/0" #@TODO next thing to fix
  gateway_id                  = aws_internet_gateway.this.id
}
