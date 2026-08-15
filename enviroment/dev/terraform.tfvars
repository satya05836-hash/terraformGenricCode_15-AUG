RG-dev = {
  RG1 = {
    name     = "RG-Imran"
    location = "Central India"
  }
}

VNET-dev = {
  VNET1 = {
    name                = "Imran-Vnet"
    location            = "Central India"
    resource_group_name = "RG-Imran"
    address_space       = ["10.1.0.0/16"]
  }
}

SUBNET-dev = {
  SUBNET1 = {
    name                 = "Frontend-subnet"
    resource_group_name  = "RG-Imran"
    virtual_network_name = "Imran-Vnet"
    address_prefixes     = ["10.1.1.0/24"]
  }

  SUBNET2 = {
    name                 = "Backend-subnet"
    resource_group_name  = "RG-Imran"
    virtual_network_name = "Imran-Vnet"
    address_prefixes     = ["10.1.4.0/24"]
  }

  AzureBastionSubnet = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "RG-Imran"
    virtual_network_name = "Imran-Vnet"
    address_prefixes     = ["10.1.5.0/24"]
  }
}

NIC-dev = {
  nic1 = {
    name                          = "Frontend-NIC"
    location                      = "Central India"
    resource_group_name           = "RG-Imran"
    ip_name                       = "internal"
    private_ip_address_allocation = "Dynamic"
    subnet_name                   = "Frontend-subnet"
    virtual_network_name          = "Imran-Vnet"


  }
}

PIP-dev = {
  pip_nat = {
    name                = "nat-pip"
    location            = "Central India"
    resource_group_name = "RG-Imran"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
  pip_bastion = {
    name                = "bastion-pip"
    location            = "Central India"
    resource_group_name = "RG-Imran"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
}

NAT-dev = {
  nat1 = {
    name                 = "my-nat-gateway"
    location             = "Central India"
    resource_group_name  = "RG-Imran"
    sku_name             = "Standard"
    public_ip_name       = "nat-pip"
    subnet_name          = "Frontend-subnet"
    virtual_network_name = "Imran-Vnet"
  }
}

BASTION-dev = {
  bastion1 = {
    name                 = "my-bastion"
    location             = "Central India"
    resource_group_name  = "RG-Imran"
    subnet_name          = "AzureBastionSubnet"
    virtual_network_name = "Imran-Vnet"
    public_ip_name       = "bastion-pip"
  }
}

VM-dev = {
  vm1 = {
    name                = "my-linux-vm"
    location            = "Central India"
    resource_group_name = "RG-Imran"
    size                = "Standard_B1s"
    admin_username      = "adminuser"
    admin_password      = "Password1234!"
    nic_name            = "Frontend-NIC"
  }
}
