
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

variable "vnet_address_space" {
  type = string
  default = "default_vent"  
}

variable "subnets" {
  type = map(any)  
}

variable "no_of_frontend_vm" {
  type = string 
  default = "2"
}