resource "aws_vpc" "this" {
  cidr_block = "10.0.0.0/16" # @TODO check what derived default is
  #enable_dns_support flag?
  #enable_dns_hostnames flag? 
  # further flags? y/n
}

# @TODO specific cidr ranges or does defaults?
resource "aws_subnet" "public" { # @TODO is public subnet needed if using IG to xyz
  vpc_id = aws_vpc.this.id
}

resource "aws_subnet" "private" {
  vpc_id = aws_vpc.this.id
}

resource "aws_internet_gateway" "this" { # to connect to public sub
  vpc_id = aws_vpc.this.id
}

resource "aws_route_table" "this" {
  vpc_id = aws_vpc.this.id
  route  = [] #@TODO pull in from vars
}

resource "aws_route_table_association" "ig_to_public_sn" { #@TODO actually only for private, not needed for this
  gateway_id     = aws_internet_gateway.this.id
  route_table_id = aws_route_table.this.id
}

# resource "aws_route_table_association" "public" {

# }

# resource "aws_route_table_association" "private" {

# }



resource "aws_route" "this" { #@TODO check if this style is deprecated
  route_table_id = aws_route_table.this.id
  gateway_id     = aws_internet_gateway.this.id
}
