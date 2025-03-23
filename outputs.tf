output "resource_group_name" {
  value = azurerm_resource_group.main.name
}

output "vnet_id" {
  description = "The ID of the created Virtual Network"
  value       = module.vnet.vnet_id
}

output "vm_public_ip" {
  value = module.vm.vm_public_ip
}


output "mysql_server_name" {
  description = "The name of the MySQL server"
  value       = module.mysql.mysql_server_name
}

output "key_vault_id" {
  description = "The ID of the Azure Key Vault"
  value       = module.keyvault.key_vault_id
}

output "wordpress_vm_public_ip" {
  value = module.vnet.wordpress_public_ip
}

output "wordpress_public_ip" {
  value = azurerm_public_ip.wordpress.ip_address
}
