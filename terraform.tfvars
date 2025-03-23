resource_group_name = "terraform-rg"
location            = "East US"

admin_username = "adminuser"

# Azure SQL Server Configuration
sql_server_name     = "wordpress-sql-guled"
sql_ad_admin        = "guledadmin"
sql_admin_username  = "adminguled"
sql_admin_password  = "SecurePassword123"
sql_sku             = "Basic"
sql_storage         = 5120
sql_admin_object_id = "ac1bdb58-5144-468b-963d-462f70b37af8"
sql_database_name   = "wordpress-db"


# Virtual Machine Configuration
vm_size       = "Standard_B2s"
vault_vm_name = "vault-server"
vm_name       = "wordpress-vm"

# Virtual Network Configuration
vnet_name               = "terraform-vnet"
vnet_address_space      = ["10.0.0.0/16"]
subnet_wordpress_prefix = "10.0.1.0/24"
subnet_vault_prefix     = "10.0.2.0/24"


key_vault_name = "guledkey1"




