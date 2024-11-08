output "sg_id" {
    value = aws_security_group.sg-webserver.id
    description = "The ID of the security group"
}