variable "resource_group_name" {
  type        = string
  description = "Azure Resource Group name"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "sql_server_name" {
  type        = string
  description = "Azure SQL Server name"
}

variable "sql_database_name" {
  type        = string
  description = "Azure SQL Database name"
}

variable "sql_admin_username" {
  type        = string
  description = "SQL Admin username"
}

variable "sql_admin_password" {
  type        = string
  description = "SQL Admin password"
  sensitive   = true
}

variable "sql_admin_object_id" {
  type        = string
  description = "Azure AD Object ID for authentication"
}

variable "sql_ad_admin" {
  type        = string
  description = "SQL Admin username for Azure SQL Server"
}
