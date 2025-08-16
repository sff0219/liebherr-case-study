output "public_instance_ids" {
  value = module.ec2.public_instance_ids
}

output "vpc_id" {
  value = module.vpc.vpc_id
}
