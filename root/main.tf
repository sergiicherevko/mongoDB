resource "aws_sns_topic" "smoke_test" {
  name = "mongo-db-${var.environment_stage}-tf-smoke-test"
}

module "vpc" {
  source = "../modules/vpc"

  name       = "mongo-db-${var.environment_stage}"
  cidr_block = "10.60.0.0/16"
  azs        = ["us-east-1a", "us-east-1b"]

  public_subnet_cidrs  = ["10.60.1.0/24", "10.60.2.0/24"]
  private_subnet_cidrs = ["10.60.101.0/24", "10.60.102.0/24"]
}

module "security_groups" {
  source = "../modules/security_groups"

  name   = "mongo-db-${var.environment_stage}"
  vpc_id = module.vpc.vpc_id
}