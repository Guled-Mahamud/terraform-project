# 🌐 Terraform Azure WordPress Project

This project is where I built a **production-like WordPress environment on Microsoft Azure** using **Terraform**. I used it as a hands-on challenge to get more comfortable with infrastructure-as-code and better understand how cloud resources work together.

---

## 📌 Project Goals

- Deploy a **WordPress server** on an Azure Virtual Machine (VM)
- Use a **Microsoft SQL Server (Azure SQL)** as the backend for WordPress
- Store sensitive credentials securely using **Azure Key Vault**
- Learn and apply **modular Terraform** practices
- Manage everything via **Terraform only**, no manual portal steps for infrastructure

---

## 📁 Project Structure

```
terraform-project/
├── main.tf                # Main file where all modules are called
├── variables.tf          # Input variables for configuration
├── outputs.tf            # Terraform output values
├── modules/              # Folder containing all the modular code
│   ├── vnet/             # Networking setup
│   ├── vm/               # WordPress and Vault VMs
│   ├── mysql/            # Azure SQL Server + DB
│   └── keyvault/         # Azure Key Vault
└── README.md             # This documentation
```

---

## 🚀 Terraform Deployment Walkthrough (My Steps)

### 1️⃣ Resource Group

Everything in Azure needs to live inside a resource group. I created this first so I could keep all resources together and easily delete everything later.

```
resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}
```

### 2️⃣ Virtual Network (VNet)

To allow the VMs and services to communicate securely, I created a VNet with two subnets:

- One for WordPress
- One for Vault

These were provisioned using a custom `vnet` module.

```
module "vnet" {
  source = "./modules/vnet"
  ...
}
```

### 3️⃣ Virtual Machines

The `vm` module provisions:

- A Linux VM for hosting WordPress
- A second  Vault VM

The WordPress VM was given a public IP and SSH key access.

```
module "vm" {
  source = "./modules/vm"
  ...
}
```

### 4️⃣ Azure SQL Server (Database)

Instead of using local MySQL, I deployed Azure SQL resources using a `mysql` module. This included:

- SQL Server instance
- WordPress database
- Admin user credentials

```
module "mysql" {
  source = "./modules/mysql"
  ...
}
```

I later created a new SQL login (`wpuser`) and granted it roles manually from the VM.

### 5️⃣ Azure Key Vault

To store sensitive data securely (like DB passwords), I used Azure Key Vault.

```
module "keyvault" {
  source = "./modules/keyvault"
  ...
}
```

Key Vault stored my SQL admin password and allowed me to retrieve it securely during Terraform runs.

### 6️⃣ Static Public IP

The WordPress VM needed a public IP to be accessible in the browser, so I added this:

```
resource "azurerm_public_ip" "wordpress" {
  name              = "wordpressPublicIP"
  allocation_method = "Static"
  sku               = "Basic"
  ...
}
```

---

## ⚙️ Manual WordPress Configuration (My Process)

After the infrastructure was deployed, I chose to do WordPress setup manually to understand each step.

### ✈️ SSH into the VM

```
ssh adminuser@<VM_Public_IP>
```

### ↡️ Installed required packages

```
sudo apt update && sudo apt install apache2 php libapache2-mod-php php-mysql unzip curl -y
```

### 🌐 Downloaded and installed WordPress

```
cd /var/www/html
sudo rm index.html
sudo curl -O https://wordpress.org/latest.tar.gz
sudo tar -xvzf latest.tar.gz
sudo mv wordpress/* .
sudo chown -R www-data:www-data /var/www/html
sudo chmod -R 755 /var/www/html
```

### ✏️ wp-config.php setup

Copied and edited the sample configuration file:

```
sudo cp wp-config-sample.php wp-config.php
sudo nano wp-config.php
```

Updated DB settings:

```
define('DB_NAME', 'wordpress-db');
define('DB_USER', 'wpuser');
define('DB_PASSWORD', 'WPPassw0rd!');
define('DB_HOST', 'wordpress-sql-guled.database.windows.net');
```

### ↺ Restarted Apache

```
sudo systemctl restart apache2
```

### 🌎 Finished setup in the browser

Opened:

```
http://<VM_Public_IP>
```

And completed the WordPress installation wizard.

---

## 🔐 How I Used Azure Key Vault

Key Vault stored the DB password as a secret, like this:

```
resource "azurerm_key_vault_secret" "db_password" {
  name         = "mysql-password"
  value        = var.sql_admin_password
  key_vault_id = azurerm_key_vault.main.id
}
```

This avoided hardcoding passwords in code and helped me get familiar with secure secret management.

---

## 💻 Commands I Used Regularly

```
# Initialize Terraform config
terraform init

# Validate syntax and structure
terraform validate

# Format code consistently
terraform fmt

# Preview planned changes
terraform plan

# Apply configuration to Azure
terraform apply

# Tear down the infrastructure
terraform destroy

# List resources in state file
terraform state list

# Remove broken resource from state
terraform state rm <resource>

# Show output values like IP
terraform output
```

---

## 🚜 Cleanup

After deleting resources manually via the portal, I ran:

```
terraform state list
terraform state rm <name>
terraform plan
terraform apply
```

To clean things up and bring Terraform back in sync.

---

## 📌 Current Status

✅ WordPress deployed
✅ Azure SQL backend configured
✅ Manual setup complete
✅ All Terraform modules working
✅ Secrets stored in Key Vault

---

## 🧐 What’s Next (Future Plans)

- Move state to a remote backend (Azure Storage Account)
- Automate WordPress install and config again
- Connect and use Vault for secure DB secrets
- Add CI/CD pipeline for infrastructure deployment
- Refactor using `locals`, `for_each`, `depends_on` for better modularity

---

Thanks for following my journey!





![alt text](<Screenshot 2025-03-22 062449.png>)
