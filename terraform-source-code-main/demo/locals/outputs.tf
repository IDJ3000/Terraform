output "username" {
  description = "username for innovative class"
  sensitive = false
  value = aws_iam_user.innovative.name
}

output "userid" {
  description = "userid for innovative class"
  sensitive = false
  value = aws_iam_user.innovative.id
}

output "unique_id" {
  description = "username for innovative class"
  sensitive = false
  value = aws_iam_user.innovative.unique_id
}