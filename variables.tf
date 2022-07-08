variable "admin-username" {
  default     = "example-admin"
  type        = string
  description = "Username for the admin on all of the provisioned servers"
}

variable "admin-password" {
  default     = "Password123"
  type        = string
  description = "Password for the admin on all of the provisioned servers"
}

variable "disk-size" {
  default     = 1024
  type        = number
  description = "size of the disk in GB"
}

variable "location" {
  default     = "East US"
  type        = string
  description = "Azure location (Ex: East US)"
}

variable "network-cidr" {
  default     = "172.16.0.0/12"
  type        = string
  description = "CIDR for the AZ vnet. A subnet will be created automatically from this"
}

variable "prefix" {
  default     = "deleteme"
  type        = string
  description = "prefix to be used when creating resource names"
}

variable "replication" {
  default     = "Premium_LRS"
  type        = string
  description = "can be either Premium_LRS or Premium_ZRS"
  validation {
    condition     = contains(["Premium_LRS", "Premium_ZRS"], var.replication)
    error_message = "Replication can be either Premium_LRS or Premium_ZRS."
  }
}

variable "subscription-id" {
  type        = string
  description = "subscription id"
}

variable "tier" {
  default     = "P30"
  type        = string
  description = "[disk performance tier](https://docs.microsoft.com/en-us/azure/virtual-machines/disks-change-performance)"
  validation {
    condition = contains([
      "P1",
      "P2",
      "P3",
      "P4",
      "P6",
      "P10",
      "P15",
      "P20",
      "P30",
      "P40",
      "P50",
      "P60",
      "P70",
      "P80",
    ], var.tier)
    error_message = "Tier must be a valid baseline performance tier."
  }
}

variable "vm-count" {
  default     = 2
  type        = number
  description = "number of VMs to be created"
}

variable "vm-size" {
  default     = "Standard_DS2"
  type        = string
  description = "The size of the vm to create. It must be compatible with premium storage"
}

