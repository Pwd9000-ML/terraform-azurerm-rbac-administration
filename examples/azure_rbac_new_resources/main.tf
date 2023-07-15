terraform {
  #backend "azurerm" {}
  backend "local" { path = "terraform-example1.tfstate" }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
}

data "azurerm_client_config" "current" {}

###################################################
# PRE-REQS (RG, KV) to test against               #
###################################################
### Random integer to generate unique names
resource "random_integer" "number" {
  min = 0001
  max = 9999
}

### Resource group to deploy the KV into
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

resource "azurerm_key_vault" "kv" {
  resource_group_name       = azurerm_resource_group.rg.name
  location                  = azurerm_resource_group.rg.location
  enable_rbac_authorization = true
  #values from variable kv_config object
  name      = lower("${var.kv_config.name}${random_integer.number.result}")
  sku_name  = var.kv_config.sku
  tenant_id = data.azurerm_client_config.current.tenant_id
  dynamic "network_acls" {
    for_each = var.kv_net_rules
    content {
      default_action             = network_acls.value.default_action
      bypass                     = network_acls.value.bypass
      ip_rules                   = network_acls.value.ip_rules
      virtual_network_subnet_ids = network_acls.value.virtual_network_subnet_ids
    }
  }
  tags = var.tags
}

##################################################
# MODULE TO TEST                                 #
##################################################
module "rbac-administration" {
  source            = "Pwd9000-ML/rbac-administration/azurerm"
  version           = ">= 1.0.0"
  azure_rbac_config = local.azure_rbac_config
}
