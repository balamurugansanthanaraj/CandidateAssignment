output "resource_group_id" {
  value = module.infrabuilder.resource_group_id
}

output "subnet_ids" {
  value = module.infrabuilder.subnet_ids
}

# output "frontend_nics" {
#   value = module.infrabuilder.frontend_nics
# }


output "frontend_vms" {
  value = module.infrabuilder.frontend_vms
}