variable "location" {
  type    = string
  default = "eastus2"
}

variable "tags" {
  type = map(string)
  default = {
    "environment" = "default_environmnet"
  }
}

variable "environment" {
  type    = string
  default = "default_environment"
}

variable "application_name" {
  type    = string
  default = "default_appName"
}

variable "vnet_address_space" {
  type    = string
  default = "10.100.0.0/16"
}

variable "subnets" {
  type = map(any)
  default = {
    "frontend" = {
      name             = "frontend"
      address_prefixes = ["10.100.2.0/24"]
    }
    "restapi" = {
      name             = "restapi"
      address_prefixes = ["10.100.3.0/24"]
    }
    "database" = {
      name             = "database"
      address_prefixes = ["10.100.4.0/24"]
    }
    "bastion" = {
      name             = "AzureBastionSubnet"
      address_prefixes = ["10.100.250.0/24"]
    }
    "gateway" = {
      name             = "GatewaySubnet"
      address_prefixes = ["10.100.0.0/24"]
    }
  }
}

variable "no_of_frontend_vm" {
  type    = string
  default = "2"
}