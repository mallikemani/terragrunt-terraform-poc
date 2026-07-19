locals {
  environment = "dev"

  virtual_network_address_space = [
    "10.10.0.0/16"
  ]

  subnets = {
    application = {
      address_prefixes = ["10.10.1.0/24"]
    }

    platform = {
      address_prefixes = ["10.10.2.0/24"]
    }
  }
}
