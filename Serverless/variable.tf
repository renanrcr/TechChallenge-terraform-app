variable "environment" {
  description = "The Deployment environment"
}

variable "handler" {
  description = "Handler"
  type = string
  default = "techchallenge_function_auth::techchallenge_function_auth.LambdaEntryPoint::FunctionHandlerAsync"
}

variable "runtime" {
  description = "Runtime .NET"
  type = string
  default = "dotnet6"
}

variable "bucket_name" {
  description = "Bucket name auth"
  type = string
  default = "techchallenge-terraform-s3-auth"
}