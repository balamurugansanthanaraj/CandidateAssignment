resource "azurerm_virtual_network" "vnet" {
  name                = "${var.application_name}_${var.environment}"
  resource_group_name = "${var.resource_group_name}"
  location            = "${var.location}"
  address_space       = ["${var.vnet_address_space}"]
  tags = "${var.tags}"
}


# resource "azurerm_subnet" "web_subnet" {
#   name                 = "frontend"
#   resource_group_name  = "${var.resource_group_name}"
#   virtual_network_name = azurerm_virtual_network.vnet.name
#   address_prefixes     = ["${var.subnet_web_address_space}"]
# }

# resource "azurerm_subnet" "api_subnet" {
#   name                 = "restapi"
#   resource_group_name  = "${var.resource_group_name}"
#   virtual_network_name = azurerm_virtual_network.vnet.name
#   address_prefixes     = ["${var.subnet_api_address_space}"]
# }

# resource "azurerm_subnet" "db_subnet" {
#   name                 = "database"
#   resource_group_name  = "${var.resource_group_name}"
#   virtual_network_name = azurerm_virtual_network.vnet.name
#   address_prefixes     = ["${var.subnet_db_address_space}"]
# }

resource "azurerm_subnet" "subnets" {
  for_each = "${var.subnets}"
  resource_group_name  = "${var.resource_group_name}"
  virtual_network_name = azurerm_virtual_network.vnet.name
  name = each.value["name"]
  address_prefixes = each.value["address_prefixes"]
}