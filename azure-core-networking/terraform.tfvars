# terraform.tfvars: This file supplies the actual values for the variables defined in main.tf.
# Terraform automatically loads values from this file.

# REQUIRED: Change this to a unique prefix for your resources. 
# Example: "corp-dev-central" will result in a Resource Group named "corp-dev-central-rg"
project_name          = "myproject-dev-network"  

# REQUIRED: Change this to your preferred Azure region (e.g., "eastus", "westus2", "centralus").
location              = "East US 2"        

# Network configuration (These values override the defaults in main.tf)
# Define the overall CIDR range for the Virtual Network.
vnet_address_space    = ["10.50.0.0/16"]

# Define the CIDR range for the primary Subnet within the VNet.
subnet_address_prefix = ["10.50.1.0/24"]
