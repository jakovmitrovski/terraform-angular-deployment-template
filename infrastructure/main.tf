module "app_infrastructure" {
  source = "./modules/app_infrastructure"

  bucket_name     = "${var.app_name}-fe"
  certificate_arn = var.certificate_arn
  domain_name     = var.domain_name
}

module "build_app" {
  source = "./modules/build_scripts"

  app_name           = var.app_name
  aws_profile        = var.aws_profile
  bucket_name        = "${var.app_name}-fe"
  s3_distribution_id = module.app_infrastructure.distribution_id
}