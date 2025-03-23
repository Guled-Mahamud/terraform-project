output "sql_server_id" {
  value = azurerm_mssql_server.db.id
}

output "sql_fqdn" {
  value = azurerm_mssql_server.db.fully_qualified_domain_name
}

output "mysql_server_name" {
  value = azurerm_mssql_server.db.name
}
