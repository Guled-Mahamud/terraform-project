terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
  }
}


provider "azurerm" {
  features {}
  subscription_id = "3f48a398-9208-4440-a19d-dad6871f363c"
}

variable "prefix" {
  default = "tfvmex"
}