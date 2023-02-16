variable "azurerm_resource_group" {
  type    = string
  default = "Terraform"
}

variable "resource_group_location" {
  type    = string
  default = "Global"
}

variable "azurerm_cdn_profile" {
  type    = string
  default = "test"
}

variable "domain" {
  type    = string
  default = "abc.com"
}

variable "prefix_domain" {
  type    = string
  default = "abc"
}