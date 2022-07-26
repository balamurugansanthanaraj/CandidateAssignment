variable "subnet_ids" {
  type = map(any)  
}

variable "no_of_vm" {
  type = string 
  default = "2"
}

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