output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

output "subnet_ids" {
  value = {
    for id in keys(var.subnets) : id => azurerm_subnet.subnets[id].id
  }
}