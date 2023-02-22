terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = "39f138b6-9b8c-448b-bfae-d1da7442b445"
  tenant_id       = "e091b02d-2fc5-43c6-a7ac-3d939016379a"
  client_id       = "e4f7c8b6-043a-4977-9ca3-ce36453a1abb"
  client_secret   = "yWV8Q~eSdrVr6ZgWnj4r~dZdnScm5l10w.wSMcit"
}

 backend "azurerm" {
    resource_group_name = var.bkstrgrg
    storage_account_name = var.bkstrg
    container_name = var.bkcontainer
    key = var.bkstrgkey
  }
}
