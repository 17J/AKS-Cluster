# Azure Region
variable "location" {
  description = "Azure region where resources will be deployed"
  type        = string
  default     = "East US"
}

# SSH Public Key
variable "ssh_public_key" {
  description = "SSH public key for the AKS node access"
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD..."  # Replace with your real SSH key
}
