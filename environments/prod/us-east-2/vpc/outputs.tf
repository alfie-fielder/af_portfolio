output "vpc_id" {
  value = module.vpc.vpc_id
}

output "lan_subnet_ids" {
  value = module.vpc.lan_subnet_ids
}

output "tgw_subnet_ids" {
  value = module.vpc.tgw_subnet_ids
}

output "route_table_id" {
  value = module.vpc.route_table_id
}
