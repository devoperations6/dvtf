# dvtf
terraform repository
#############################
the usage of terraform module in this repository is 

module "network" {
  source    = "../../modules/network"
  vpc_cidr  = "10.0.0.0/16"
  env       = "dev"
}
