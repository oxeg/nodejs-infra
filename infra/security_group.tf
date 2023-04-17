module "fake_production_security_group" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "fake-production-sg"
  description = "Security group for Fake Product Production"
  vpc_id      = module.vpc_production.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["all-all"]
}

module "fake_staging_security_group" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "fake-staging-sg"
  description = "Security group for Fake Product Staging"
  vpc_id      = module.vpc_staging.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["all-all"]
}