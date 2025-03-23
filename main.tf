resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}


module "vnet" {
  source                  = "./modules/vnet"
  resource_group_name     = azurerm_resource_group.main.name
  location                = var.location
  vnet_name               = var.vnet_name
  vnet_address_space      = var.vnet_address_space
  subnet_names            = var.subnet_names
  subnet_wordpress_prefix = var.subnet_wordpress_prefix
  subnet_vault_prefix     = var.subnet_vault_prefix

}



module "vm" {
  source                     = "./modules/vm"
  resource_group_name        = azurerm_resource_group.main.name
  location                   = var.location
  vm_name                    = var.vm_name
  vault_vm_name              = var.vault_vm_name
  admin_username             = var.admin_username
  vm_size                    = var.vm_size
  network_interface_id       = module.vnet.wordpress_network_interface_id
  vault_network_interface_id = module.vnet.vault_network_interface_id
}


module "mysql" {
  source              = "./modules/mysql"
  resource_group_name = azurerm_resource_group.main.name
  location            = var.location

  sql_server_name     = var.sql_server_name
  sql_database_name   = var.sql_database_name
  sql_admin_username  = var.sql_admin_username
  sql_admin_password  = var.sql_admin_password
  sql_admin_object_id = var.sql_admin_object_id
  sql_ad_admin        = var.sql_ad_admin
}



module "keyvault" {
  source              = "./modules/keyvault"
  resource_group_name = azurerm_resource_group.main.name
  location            = var.location
  key_vault_name      = var.key_vault_name
  sql_admin_username  = var.sql_admin_username
  sql_admin_password  = var.sql_admin_password
  sql_server_name     = var.sql_server_name
  sql_sku             = var.sql_sku
  sql_storage         = var.sql_storage
}


resource "azurerm_public_ip" "wordpress" {
  name                = "wordpressPublicIP"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"
  sku                 = "Basic"
}



