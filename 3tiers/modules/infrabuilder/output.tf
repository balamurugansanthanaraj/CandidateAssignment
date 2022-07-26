output "resource_group_id" {
  value = module.resourcegroup.resource_group_id
}

output "subnet_ids" {
  value = module.networking.subnet_ids
}

# output "frontend_nics" {
#   value = module.frontend.frontend_nics
# }

output "frontend_vms" {
  value = module.frontend.frontend_vms
}