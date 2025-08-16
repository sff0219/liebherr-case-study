resource "aws_instance" "public_instances" {
  count                       = length(var.public_subnet_ids)
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = element(var.public_subnet_ids, count.index)
  vpc_security_group_ids      = [var.security_group_id]
  key_name                    = var.key_name
  associate_public_ip_address = true

  tags = {
    Name = "Terraform EC2 ${count.index + 1}"
  }
}
