module "network" {
  source    = "../network"
  vpc_cidr  = var.vpc_cidr
  env       = var.env
}
