terraform {
  backend "azurerm" {}
  #backend "local" { path = "terraform-test2.tfstate" }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
}

provider "azuread" {}

###################################################
# PRE-REQS Create AAD groups                      #
###################################################
resource "azuread_group" "rbac" {
  display_name     = var.aadGroup
  owners           = concat(data.azuread_users.GroupOwners.object_ids, [data.azuread_client_config.current.object_id])
  security_enabled = true
}

##################################################
# MODULE TO TEST                                 #
##################################################
module "rbac-administration" {
  source            = "../.."
  azure_rbac_config = local.azure_rbac_config
}