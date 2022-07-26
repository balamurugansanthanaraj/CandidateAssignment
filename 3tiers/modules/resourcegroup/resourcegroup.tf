resource "azurerm_resource_group" "rg" {
  name = "${var.application_name}_${var.environment}"
  location = "${var.location}"
  tags = "${var.tags}"
}