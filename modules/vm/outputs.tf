output "vm_id" {
  description = "The ID of the Virtual Machine"
  value       = azurerm_linux_virtual_machine.wordpress.id
}

output "vm_public_ip" {
  description = "The public IP address of the VM"
  value       = azurerm_linux_virtual_machine.wordpress.public_ip_address
}


