# resource "aws_instance" "this" {
#   ami                    = "ami-017c001a88dd93847"
#   instance_type          = "t2.micro"
#   vpc_security_group_ids = []
# }


## @TODO grab networking resource IDs from networking module via variables, referencing modules in overarching main.tf