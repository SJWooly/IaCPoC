resource "aws_instance" "this" {
  subnet_id              = var.subnet_id
  ami                    = "ami-01cae1550c0adea9c"
  instance_type          = "t2.micro"
  vpc_security_group_ids = var.vpc_security_group_ids
  user_data = file("compute/instanceConfig.sh")
}
