provider "azurerm" {
  features {

  }
}
# locals {
#   environment_path = "./environment/dev"
# }

# data "terraform_remote_state" "state" {
#   backend = "local"

#   config = {
#     path = "terraform_dev.tfstate"
#   }
# }

module "infrabuilder" {
  source             = "./modules/infrabuilder"
  location           = var.location
  environment        = var.environment
  application_name   = var.application_name
  tags               = var.tags
  vnet_address_space = var.vnet_address_space
  subnets            = var.subnets
  no_of_frontend_vm  = var.no_of_frontend_vm
}