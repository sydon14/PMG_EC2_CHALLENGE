output "public_ip" {
  value = aws_eip.challenge.public_ip
}

output "instance_id" {
  value = module.challenge.id
}
