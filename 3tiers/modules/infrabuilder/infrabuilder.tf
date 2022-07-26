module "resourcegroup" {
  source = "../resourcegroup"
  location = "${var.location}"
  environment = "${var.environment}"
  application_name = "${var.application_name}"
  tags = "${var.tags}"
}

module "networking" {
  source = "../networking"
  resource_group_name = "${module.resourcegroup.resource_group_name}"
  location = "${var.location}"
  environment = "${var.environment}"
  application_name = "${var.application_name}"
  tags = "${var.tags}"
  vnet_address_space = "${var.vnet_address_space}"
  subnets = "${var.subnets}"
}



module "frontend" {
  source = "../frontend"
  resource_group_name = "${module.resourcegroup.resource_group_name}"
  location = "${var.location}"
  environment = "${var.environment}"
  application_name = "${var.application_name}"
  tags = "${var.tags}"
  subnet_ids = "${module.networking.subnet_ids}"
  no_of_vm = "${var.no_of_frontend_vm}"
}