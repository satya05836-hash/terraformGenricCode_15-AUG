module "RG_module" {
 source = "../../Child Module/azurerm_Resource_group"
RG=var.RG-dev
}

module "vnet-dev" {
  depends_on = [ module.RG_module ]
  source = "../../Child Module/Azurerm_VNET"
  vnet = var.VNET-dev
}

module "subnet-dev" {
  depends_on = [ module.vnet-dev ]
  source = "../../Child Module/azurerm_Subnet"
  subnet = var.SUBNET-dev
}


module "nic-dev" {
  depends_on = [ module.subnet-dev ]
  source = "../../Child Module/azurerm_nic"
  nic = var.NIC-dev
}

module "public_ip-dev" {
  depends_on = [ module.RG_module ]
  source = "../../Child Module/azurerm_public_ip"
  public_ip = var.PIP-dev
}

module "nat_gateway-dev" {
  depends_on = [ module.public_ip-dev, module.subnet-dev ]
  source = "../../Child Module/azurerm_nat_gateway"
  nat_gateway = var.NAT-dev
}

module "bastion-dev" {
  depends_on = [ module.public_ip-dev, module.subnet-dev ]
  source = "../../Child Module/azurerm_bastion_host"
  bastion = var.BASTION-dev
}

module "linux_vm-dev" {
  depends_on = [ module.nic-dev ]
  source = "../../Child Module/azurerm_linux_virtual_machine"
  vm = var.VM-dev
}