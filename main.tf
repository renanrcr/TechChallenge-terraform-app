locals {
  azs = ["${var.region}a", "${var.region}b"]
}

module "serverless" {
  source = "./modules/serverless"
  environment = var.environment
}

module "apigateway" {
  source = "./modules/apiGateway"
  environment = var.environment
  arn = module.serverless.lambda_invoke_arn
  function_name = module.serverless.lambda_function_name
}