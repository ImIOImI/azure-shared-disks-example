<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.13.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.13.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_managed_disk.example](https://registry.terraform.io/providers/hashicorp/azurerm/3.13.0/docs/resources/managed_disk) | resource |
| [azurerm_network_interface.main](https://registry.terraform.io/providers/hashicorp/azurerm/3.13.0/docs/resources/network_interface) | resource |
| [azurerm_resource_group.example](https://registry.terraform.io/providers/hashicorp/azurerm/3.13.0/docs/resources/resource_group) | resource |
| [azurerm_subnet.internal](https://registry.terraform.io/providers/hashicorp/azurerm/3.13.0/docs/resources/subnet) | resource |
| [azurerm_virtual_machine.compute](https://registry.terraform.io/providers/hashicorp/azurerm/3.13.0/docs/resources/virtual_machine) | resource |
| [azurerm_virtual_machine_data_disk_attachment.example](https://registry.terraform.io/providers/hashicorp/azurerm/3.13.0/docs/resources/virtual_machine_data_disk_attachment) | resource |
| [azurerm_virtual_network.main](https://registry.terraform.io/providers/hashicorp/azurerm/3.13.0/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin-password"></a> [admin-password](#input\_admin-password) | Password for the admin on all of the provisioned servers | `string` | `"Password123"` | no |
| <a name="input_admin-username"></a> [admin-username](#input\_admin-username) | Username for the admin on all of the provisioned servers | `string` | `"example-admin"` | no |
| <a name="input_disk-size"></a> [disk-size](#input\_disk-size) | size of the disk in GB | `number` | `1024` | no |
| <a name="input_location"></a> [location](#input\_location) | Azure location (Ex: East US) | `string` | `"East US"` | no |
| <a name="input_network-cidr"></a> [network-cidr](#input\_network-cidr) | CIDR for the AZ vnet. A subnet will be created automatically from this | `string` | `"172.16.0.0/12"` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | prefix to be used when creating resource names | `string` | `"deleteme"` | no |
| <a name="input_replication"></a> [replication](#input\_replication) | can be either Premium\_LRS or Premium\_ZRS | `string` | `"Premium_LRS"` | no |
| <a name="input_subscription-id"></a> [subscription-id](#input\_subscription-id) | subscription id | `string` | n/a | yes |
| <a name="input_tier"></a> [tier](#input\_tier) | [disk performance tier](https://docs.microsoft.com/en-us/azure/virtual-machines/disks-change-performance) | `string` | `"P30"` | no |
| <a name="input_vm-count"></a> [vm-count](#input\_vm-count) | number of VMs to be created | `number` | `2` | no |
| <a name="input_vm-size"></a> [vm-size](#input\_vm-size) | The size of the vm to create. It must be compatible with premium storage | `string` | `"Standard_DS2"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->