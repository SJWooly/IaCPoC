resource "aws_vpc""this" {
    cidr_block = "10.0.0.0/16" # @TODO check what derived default is
}

# variable "subnet_id" {} ## @TODO docs sample usage

# data "aws_subnet" "selected" {
#   id = var.subnet_id
# }

# resource "aws_security_group" "subnet" {
#   vpc_id = data.aws_subnet.selected.vpc_id

#   ingress {
#     cidr_blocks = [data.aws_subnet.selected.cidr_block]
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#   }
# }

resource "aws_subnet" "public" { # @TODO is public subnet needed if using IG to xyz

}

resource "aws_subnet" "private" {
    
}

resource "aws_route_table" "this" {

}

resource "aws_route_table_association" "public" {
  
}

resource "aws_route_table_association" "private" {
  
}

resource "aws_internet_gateway" "this" {

}

resource "aws_route" "this" { #@TODO check if this style is deprecated

}