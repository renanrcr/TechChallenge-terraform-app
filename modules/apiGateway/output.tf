output "rest_api_id" {
  description = "REST API id"
  value = aws_api_gateway_rest_api.api_gateweay_techchallenge.id
}

output "deployment_id" {
  description = "Deployment id"
  value = aws_api_gateway_deployment.gateway_deployment.id
}

output "deployment_invoke_url" {
  description = "Deployment invoke url"
  value = aws_api_gateway_deployment.gateway_deployment.invoke_url
}

output "deployment_execution_arn" {
  description = "Deployment execution ARN"
  value = aws_api_gateway_deployment.gateway_deployment.execution_arn
}

output "name" {
  description = "API Gateway name"
  value = aws_api_gateway_rest_api.api_gateweay_techchallenge.name
}