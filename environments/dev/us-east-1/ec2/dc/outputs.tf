output "instance_id" {
  description = "The ID of the domain controller EC2 instance."
  value       = module.dc.instance_id
}

output "private_ip" {
  description = "The private IP address of the domain controller."
  value       = module.dc.private_ip
}

output "private_dns" {
  description = "The private DNS name of the domain controller."
  value       = module.dc.private_dns
}

output "availability_zone" {
  description = "The availability zone the domain controller was launched in."
  value       = module.dc.availability_zone
}

output "instance_state" {
  description = "The current state of the domain controller instance."
  value       = module.dc.instance_state
}
