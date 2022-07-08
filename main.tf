terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.13.0"
    }
  }
}

locals {
  admin-username  = var.admin-username
  admin-password  = var.admin-password
  disk-size       = var.disk-size
  location        = var.location
  network-cidr    = var.network-cidr
  prefix          = var.prefix
  replication     = var.replication
  subscription-id = var.subscription-id
  tier            = var.tier
  vm_name         = "${var.prefix}-vm"
  vm_count        = var.vm-count
  vm_size         = var.vm-size


  cidr-vnet   = var.network-cidr
  cidr-subnet = cidrsubnet(local.cidr-vnet, 4, 0)

}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
  subscription_id = local.subscription-id
}

resource "azurerm_resource_group" "example" {
  name     = "${var.prefix}-resources"
  location = "East US"
}
