variable "subnet_id" {
  description = "ID of subnet for EC2 to be launched in"
  type = string
}
variable "vpc_security_group_ids" {
  type = list(string)
}