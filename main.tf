locals {
  azs = ["${var.region}a", "${var.region}b"]
}

module "serverless" {
  source = "./Serverless"
  environment = var.environment
}

module "apigateway" {
  source = "./APIGateway"
  environment = var.environment
  arn = module.serverless.lambda_invoke_arn
  function_name = module.serverless.lambda_function_name
}