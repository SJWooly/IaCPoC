variable "subnet_id" {
  description = "ID of subnet for EC2 to be launched in (in our case, private)"
  type = string
}
variable "vpc_security_group_ids" {
  type = list(string)
}