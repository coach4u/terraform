resource "azurerm_virtual_network" "testvnet" {
  name                = "my-vnet"
  address_space       = var.vnet_cidr
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "testvnet_sub" {
  for_each = var.subnets

  name                 = "${azurerm_virtual_network.testvnet.name}-${each.key}"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.testvnet.name
  address_prefixes     = [each.value]
}

# Internet Gateway
resource "azurerm_public_ip" "internet_gateway_ip" {
  name                = "internet-gateway-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static" # Recommended for stability
}

resource "azurerm_nat_gateway" "internet_gateway" {
  name                = "internet-nat-gateway"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = "Standard"

}

resource "azurerm_nat_gateway_public_ip_association" "nat_gateway_ip_association" {
  nat_gateway_id    = azurerm_nat_gateway.internet_gateway.id
  public_ip_address_id = azurerm_public_ip.internet_gateway_ip.id
}

#resource "azurerm_nat_gateway_subnet_association" "subnetnat_association" {
#  subnet_id      = azurerm_subnet.testvnet_sub.id
#  nat_gateway_id = azurerm_nat_gateway.internet_gateway.id
#}

resource "azurerm_subnet_nat_gateway_association" "subnetnat_association" {
  subnet_id = azurerm_subnet.testvnet_sub["subnet1"].id
  nat_gateway_id = azurerm_nat_gateway.internet_gateway.id
}

resource "azurerm_route_table" "public_rt" {
    name="public-subnet-rt"
    location = var.location
    resource_group_name = var.resource_group_name

    route {
       name           = "internet-access"
       address_prefix = "0.0.0.0/0"
       next_hop_type  = "Internet"
  }
}

resource "azurerm_subnet_route_table_association" "public_subnet_association" {
    subnet_id= azurerm_subnet.testvnet_sub["subnet2"].id
    route_table_id = azurerm_route_table.public_rt.id
}
