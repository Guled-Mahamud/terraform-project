output "vnet_id" {
  description = "The ID of the Virtual Network"
  value       = azurerm_virtual_network.main.id
}

output "subnet_ids" {
  value = {
    wordpress = azurerm_subnet.wordpress.id
    vault     = azurerm_subnet.vault.id
  }
}

output "network_interface_id" {
  value = azurerm_network_interface.wordpress.id
}

output "wordpress_network_interface_id" {
  value = azurerm_network_interface.wordpress.id
}

output "vault_network_interface_id" {
  value = azurerm_network_interface.vault.id
}

output "wordpress_public_ip" {
  value = azurerm_public_ip.wordpress.ip_address
}

