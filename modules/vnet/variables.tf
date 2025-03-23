variable "resource_group_name" {
  type        = string
  description = "The name of the Azure Resource Group"
}

variable "location" {
  type        = string
  description = "Azure region where resources will be deployed"
}

variable "vnet_name" {
  type        = string
  description = "The name of the Virtual Network"
}

variable "vnet_address_space" {
  type        = list(string)
  description = "The address space for the Virtual Network"
}

variable "subnet_names" {
  type        = list(string)
  description = "List of subnet names"
}

variable "subnet_wordpress_prefix" {
  type        = string
  description = "Subnet prefix for the WordPress VM"
}

variable "subnet_vault_prefix" {
  type        = string
  description = "Subnet prefix for the Vault VM"
}
