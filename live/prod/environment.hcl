locals {
  environment = "prod"

  virtual_network_address_space = [
    "10.20.0.0/16"
  ]

  subnets = {
    application = {
      address_prefixes = ["10.20.1.0/24"]
    }

    platform = {
      address_prefixes = ["10.20.2.0/24"]
    }
  }
}
