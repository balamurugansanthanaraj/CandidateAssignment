# variable "resoruce_group_name" {
#   type        = string
#   default     = "rg_default"  
#   description = "Name of resoruce group"
# }

variable "location" {
  type        = string
  default = "eastus2"  
}

variable "tags" {
  type = map(string)
  default = {
    "environment" = "default_environmnet"
  }
}

variable "environment" {
 type = string
 default =  "default_environment" 
}

variable "application_name" {
  type = string
  default = "default_appName"  
}