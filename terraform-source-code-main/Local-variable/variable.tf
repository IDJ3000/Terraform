variable "instance_type" {
  description = "instance types expected"
  type        = list(any)
  # default     = ["t2.small", "t2.large", "t3.nano", "t4.large"]
  sensitive   = false
}