# Create a Network Security Group
resource "azurerm_network_security_group" "ssh_nsg" {
  name                = "allow-ssh-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*" # For more security, set your own IP (e.g., "203.0.113.5")
    destination_address_prefix = "*"
  }
}


resource "azurerm_subnet_network_security_group_association" "public_subnet_nsg" {
  subnet_id                 = azurerm_subnet.testvnet_sub["subnet2"].id
  network_security_group_id = azurerm_network_security_group.ssh_nsg.id
}

# Public IP for the VM
resource "azurerm_public_ip" "vm_public_ip" {
  name                = "vm-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

# Network Interface for the VM
resource "azurerm_network_interface" "vm_nic" {
  name                = "vm-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.testvnet_sub["subnet2"].id  # public subnet
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm_public_ip.id
  }
}

# SSH Key or password authentication - example uses password
resource "azurerm_linux_virtual_machine" "public_vm" {
  name                = "public-vm"
  location            = var.location
  resource_group_name = var.resource_group_name
  network_interface_ids = [
    azurerm_network_interface.vm_nic.id,
  ]
  size               = "Standard_B1s"
  admin_username     = "azureuser"
  admin_password     = "xxxxxxxxxxxx"  # Use a secure password in production
  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    name                 = "osdisk"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}

