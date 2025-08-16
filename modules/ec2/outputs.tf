output "public_instance_ids" {
  value = aws_instance.public_instances[*].id
}
