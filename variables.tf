variable "env" {
  default = {
    subscription = "f55a9c04-d605-4b56-9e3b-9a4b4d8db8cc"
  }
}

variable "tags" {
  default = {
    location    = "chinaeast2"
    environment = "prd"
    customer    = "Learn"
    owner       = "Somebody"
    email       = "somebody@mail.com"
    title       = "Engineer"
    department  = "IS"
  }
}

variable "azurerm_resources" {
  default = {
    rg = [
      {
        name     = "rg-aks-prd-001"
        location = "eastasia"
        tags     = {
          project = "kubernetes"
        }
        role_assignment = []
      }
    ]
    aks = [
      {
        name     = "aks-infra-prd-eastasia-001"
        location = "eastasia"
        version  = "1.30.6"
        private_cluster    = true
        sku_tier           = "Free"
        addon_profile = {}
        tags = {
          project = "kubernetes"
        }
        role_based_access_control = {
          enabled = true
          azure_active_directory = {
            managed = true
            azure_rbac_enabled = true
          }
        }
        identity = {
          type = "SystemAssigned"
          user_assigned_identity_id = null
        }
        service_principal = {}
        kubelet_config = {}
        linux_os_config = {}
        network_profile = {
          docker_bridge_cidr = "172.17.0.1/16"
          service_cidr       = "10.0.0.0/16"
          plugin     = "azure"
          resource_group  = "rg-p-network-containers-eastasia-001"
          virtual_network = "vnet-p-network-containers-eastasia-001"
          subnet          = "snet-p-network-aks-eastasia-001"
        }
        default_node_pool = {
          vm_size = "Standard_B2s"
          os_disk_size_gb = "63"
          auto_scaling = true
          host_encryption = false
          ultra_ssd = false
          node_count = "1"
          max_count = "1"
          min_count = "1"
          max_surge = "50%"
          max_pods = "30"
          labels = {}
        }
        node_pool = [
          {
            name = "poolA"
            os_type = "Linux"
            vm_size = "Standard_B2s"
            os_disk_size_gb = "63"
            auto_scaling = true
            host_encryption = false
            ultra_ssd = false
            node_count = "0"
            max_count = "2"
            min_count = "0"
            max_surge = "50%"
            max_pods = "30"
            labels = {}         
          }
        ]
        tags     = {
          project = "kubernetes"
        }
        role_assignment = []
      }
    ]
  }
}