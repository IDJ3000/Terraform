output "vpc-id" {
  value = aws_vpc.name.id
}

output "public-ip" {
  value = aws_instance.web.public_ip
}