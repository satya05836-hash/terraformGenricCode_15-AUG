data "azurerm_public_ip" "pip" {
  for_each            = var.nat_gateway
  name                = each.value.public_ip_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_subnet" "subnet" {
  for_each             = var.nat_gateway
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

resource "azurerm_nat_gateway" "natgw" {
  for_each            = var.nat_gateway
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku_name            = each.value.sku_name
}

resource "azurerm_nat_gateway_public_ip_association" "natgw_pip" {
  for_each             = var.nat_gateway
  nat_gateway_id       = azurerm_nat_gateway.natgw[each.key].id
  public_ip_address_id = data.azurerm_public_ip.pip[each.key].id
}

resource "azurerm_subnet_nat_gateway_association" "natgw_subnet" {
  for_each       = var.nat_gateway
  subnet_id      = data.azurerm_subnet.subnet[each.key].id
  nat_gateway_id = azurerm_nat_gateway.natgw[each.key].id
}
