# output "fontend_nics" {
#   value = "${azurerm_network_interface.fontend_nics.*.id}"
# }


output "frontend_vms" {
  value = azurerm_virtual_machine.frontend_vms.*.name
}