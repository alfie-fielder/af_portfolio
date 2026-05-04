output "instance_id" {
  description = "The ID of the app server EC2 instance."
  value       = module.app_server.instance_id
}

output "private_ip" {
  description = "The private IP address of the app server."
  value       = module.app_server.private_ip
}

output "private_dns" {
  description = "The private DNS name of the app server."
  value       = module.app_server.private_dns
}

output "availability_zone" {
  description = "The availability zone the app server was launched in."
  value       = module.app_server.availability_zone
}

output "instance_state" {
  description = "The current state of the app server instance."
  value       = module.app_server.instance_state
}

output "ami_id" {
  description = "The AMI ID used to launch the app server, sourced from Packer."
  value       = data.aws_ami.app_server.id
}

output "ami_name" {
  description = "The name of the Packer AMI used to launch the app server."
  value       = data.aws_ami.app_server.name
}
