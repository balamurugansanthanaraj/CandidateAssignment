location         = "eastus"
application_name = "3tier"
environment      = "dev"
tags = {
  "environment"      = "dev"
  "application_name" = "3tier"
  "location"         = "eastus"
}

vnet_address_space = "10.101.0.0/16"

subnets = {
  "frontend" = {
    name             = "frontend"
    address_prefixes = ["10.101.2.0/24"]
  }
  "restapi" = {
    name             = "restapi"
    address_prefixes = ["10.101.3.0/24"]
  }
  "database" = {
    name             = "database"
    address_prefixes = ["10.101.4.0/24"]
  }
  "bastion" = {
    name             = "AzureBastionSubnet"
    address_prefixes = ["10.101.250.0/24"]
  }
  "gateway" = {
    name             = "GatewaySubnet"
    address_prefixes = ["10.101.0.0/24"]
  }
}

no_of_frontend_vm = "2"