resource "azurerm_network_interface" "fontend_nics" {
  count     = "${var.no_of_vm}"  
  name                = "${var.application_name}_${var.environment}_frontend_${count.index}"
  resource_group_name = "${var.resource_group_name}"
  location            = "${var.location}"

  ip_configuration {
    name                          = "frontend_${count.index}"
    subnet_id                     = "${lookup(var.subnet_ids, "frontend", "not_found")}"
    private_ip_address_allocation = "Dynamic"
  }
}

# locals {
#    zones = toset(["1","2","3"])
# }

resource "azurerm_availability_set" "frontend_as" {
   name                = "${var.application_name}_${var.environment}_frontend"
  resource_group_name = "${var.resource_group_name}"
  location            = "${var.location}"

}

resource "azurerm_virtual_machine" "frontend_vms" {
  count               = "${var.no_of_vm}"  
  name                = "${var.application_name}${var.environment}frontend${count.index}"
  resource_group_name = "${var.resource_group_name}"
  location            = "${var.location}"
  network_interface_ids         = ["${azurerm_network_interface.fontend_nics[count.index].id}"]  
  
  vm_size                       = "Standard_DS1_v2"
  delete_os_disk_on_termination = true
  availability_set_id           = "${azurerm_availability_set.frontend_as.id}"
  

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "${var.application_name}_${var.environment}_frontend_${count.index}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "${var.application_name}${var.environment}frontend${count.index}"
    admin_username = "admintest"
    admin_password = "ZWDC.:8920207"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}