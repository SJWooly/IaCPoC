output "vpc_id" {
  value = aws_vpc.this.id
}

output "vpc_security_group_ids" {
  value = [aws_security_group.tls_http.id]
}

output "private_subnet_id" {
  value = aws_subnet.private.id
}