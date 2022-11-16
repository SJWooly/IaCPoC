resource "aws_vpc""this" {
    cidr_block = "10.0.0.0/16" # @TODO check what derived default is
    #enable_dns_support flag?
    #enable_dns_hostnames flag? 
    # further flags? y/n
}

resource "aws_subnet" "public" { # @TODO is public subnet needed if using IG to xyz
    vpc_id = aws_vpc.this.id
}

resource "aws_subnet" "private" {
    vpc_id = aws_vpc.this.id
}

# resource "aws_route_table" "this" {

# }

# resource "aws_route_table_association" "public" {
  
# }

# resource "aws_route_table_association" "private" {
  
# }

# resource "aws_internet_gateway" "this" {

# }

# resource "aws_route" "this" { #@TODO check if this style is deprecated

# }