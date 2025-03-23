variable "resource_group_name" {
  type        = string
  description = "Name of the Azure Resource Group"
}

variable "location" {
  type        = string
  description = "Azure Region where resources will be deployed"
}

variable "vm_name" {
  type        = string
  description = "The name of the WordPress virtual machine"
}

variable "vault_vm_name" {
  type        = string
  description = "The name of the Vault virtual machine"
}

variable "admin_username" {
  type        = string
  description = "Admin username for VM"
}

variable "vm_size" {
  type        = string
  description = "Size of the virtual machine"
}

variable "subnet_wordpress_prefix" {
  type        = string
  description = "Subnet prefix for the WordPress VM"
}

variable "subnet_vault_prefix" {
  type        = string
  description = "Subnet prefix for the Vault"
}

variable "sql_server_name" {
  type        = string
  description = "Name of the Azure SQL Server"
}

variable "sql_database_name" {
  type        = string
  description = "Name of the Azure SQL Database"
}

variable "sql_admin_username" {
  type        = string
  description = "Admin username for the Azure SQL Database"
}

variable "sql_admin_password" {
  type        = string
  description = "Admin password for the Azure SQL Database"
  sensitive   = true
}

variable "sql_admin_object_id" {
  type        = string
  description = "Azure AD Object ID for SQL Server authentication"
}

variable "sql_ad_admin" {
  type        = string
  description = "SQL Admin username for Azure SQL Server"
}


variable "sql_sku" {
  type        = string
  description = "Valid SKU Name for Azure SQL Server"
  default     = "Standard_B1ms" # ✅ Update this!
}

variable "sql_storage" {
  type        = number
  description = "Storage size in MB for Azure SQL Server"
}


variable "key_vault_name" {
  type        = string
  description = "Azure Key Vault name"
}


variable "vnet_name" {
  type        = string
  description = "The name of the Virtual Network"
}

variable "vnet_address_space" {
  type        = list(string)
  description = "The address space for the Virtual Network"
  default     = ["10.0.0.0/16"]
}

variable "subnet_names" {
  type        = list(string)
  description = "List of subnet names"
  default     = ["wordpress-subnet", "vault-subnet"]
}

variable "subnet_prefixes" {
  type        = list(string)
  description = "List of subnet prefixes"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}


