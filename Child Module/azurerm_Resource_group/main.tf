variable "RG" {
  
}


resource "azurerm_resource_group" "rg" {
    for_each = var.RG
  name     = each.value.name
  location = each.value.location
}

resource"azurerm_storage_account" "st" {
  for_each = var.RG
  name                     = each.value.st_name
  resource_group_name      = azurerm_resource_group.rg[each.key].name
  location                 = azurerm_resource_group.rg[each.key].location
  account_tier             = each.value.st_tier
  account_replication_type = each.value.st_replication_type
}
