resource "azurerm_virtual_network" "main" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.vnet_address_space
}

resource "azurerm_subnet" "wordpress" {
  name                 = "wordpress-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = [var.subnet_wordpress_prefix]
}

resource "azurerm_subnet" "vault" {
  name                 = "vault-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = [var.subnet_vault_prefix]
}

resource "azurerm_network_interface" "vault" {
  name                = "vault-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "vault-ip-config"
    subnet_id                     = azurerm_subnet.vault.id
    private_ip_address_allocation = "Dynamic"
  }
}

# ✅ Define Public IP for WordPress
resource "azurerm_public_ip" "wordpress" {
  name                = "wordpressPublicIP"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"
  sku                 = "Basic"
}

# ✅ Single correct WordPress NIC with Public IP
resource "azurerm_network_interface" "wordpress" {
  name                = "wordpress-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "wordpress-ip-config"
    subnet_id                     = azurerm_subnet.wordpress.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.wordpress.id
  }
}

