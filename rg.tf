module "resource_group" {
  source   = "git::https://github.com/goldstrike77/terraform-module-azurerm.git//resource-group?ref=v0.1"
  tags     = var.tags
  azurerm_resources = var.azurerm_resources
}