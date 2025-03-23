variable "resource_group_name" {
  type        = string
  description = "Azure Resource Group name"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "key_vault_name" {
  type        = string
  description = "Azure Key Vault name"
}

variable "sql_admin_username" {
  type        = string
  description = "SQL admin username"
}

variable "sql_admin_password" {
  type        = string
  description = "SQL admin password"
  sensitive   = true
}

variable "sql_server_name" {
  type        = string
  description = "Azure SQL server name"
}

variable "sql_sku" {
  type        = string
  description = "SKU Name for SQL Server"
}

variable "sql_storage" {
  type        = number
  description = "Storage size in MB for SQL Server"
}
