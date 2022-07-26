
variable "location" {
  type        = string
  default = "eastus2"  
}

variable "tags" {
  type = map(string)
  default = {
    "environment" = "dev"
  }
}

variable "environment" {
 type = string
 default =  "dev" 
}

variable "application_name" {
  type = string
  default = "default_appName"  
}
variable "resource_group_name" {
  type = string
  default = "default_rg_name"  
}

variable "vnet_address_space" {
  type = string
  default = "10.100.0.0/16"  
}

variable "subnets" {
  type = map(any)  
}


# variable "frontend_subnet_address_space" {
#   type = string
#   default = "10.100.2.0/24"  
# }

# variable "restapi_subnet_address_space" {
#   type = string
#   default = "10.100.3.0/24"  
# }

# variable "database_subnet_address_space" {
#   type = string
#   default = "10.100.4.0/24"  
# }
