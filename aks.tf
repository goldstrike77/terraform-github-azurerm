module "kubernetes_cluster" {
  source   = "git::https://github.com/goldstrike77/terraform-module-azurerm.git//kubernetes-cluster?ref=v0.1"
  tags     = var.tags
  azurerm_resources = var.azurerm_resources
  depends_on = [module.resource_group]
}