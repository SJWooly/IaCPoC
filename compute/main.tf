resource "aws_instance" "this" {
  ami                    = "ami-0e8225827581c983a" #@TODO double check ami for region
  instance_type          = "t2.micro"
  vpc_security_group_ids = []
}


## @TODO grab networking resource IDs from networking module via variables, referencing modules in overarching main.tf