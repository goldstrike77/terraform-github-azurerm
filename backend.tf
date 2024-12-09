terraform {
  backend "azurerm" {
    environment = "public"
    resource_group_name = "terraform-state"
    storage_account_name = "satfstate01ssaz"
    container_name = "tfstat"
    key = "terraform-github-azurerm/aks/terraform.tfstate"
    subscription_id = "b971283c-e0b7-46a4-9496-9cbfb850ebe5"
    tenant_id = "e824e20c-c5d7-4a69-adb1-3494404763a5"
  }
}