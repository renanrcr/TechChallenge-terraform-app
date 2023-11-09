resource "aws_api_gateway_rest_api" "api_gateweay_techchallenge" {
  name = "techchallenge_api_auth"
  tags = {
    Name = "techchallenge_apigateway"
  }
}

resource "aws_api_gateway_documentation_part" "documentation_part" {
  location {
    type = "API"
  }

  properties  = "{\"description\":\"TechChallenge_APIGateway\"}"
  rest_api_id = aws_api_gateway_rest_api.api_gateweay_techchallenge.id
}

resource "aws_api_gateway_documentation_version" "documentation" {
  version = "1.0"
  rest_api_id = aws_api_gateway_rest_api.api_gateweay_techchallenge.id
  description = "TechChallenge - APIGateway Auth"
  depends_on  = [aws_api_gateway_documentation_part.documentation_part]
}

resource "aws_api_gateway_resource" "proxy" {
  rest_api_id = "${aws_api_gateway_rest_api.api_gateweay_techchallenge.id}"
  parent_id   = "${aws_api_gateway_rest_api.api_gateweay_techchallenge.root_resource_id}"
  path_part   = "{proxy+}"
}

resource "aws_api_gateway_method" "proxy" {
  rest_api_id   = "${aws_api_gateway_rest_api.api_gateweay_techchallenge.id}"
  resource_id   = "${aws_api_gateway_resource.proxy.id}"
  http_method   = "ANY"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "lambda" {
  rest_api_id = "${aws_api_gateway_rest_api.api_gateweay_techchallenge.id}"
  resource_id = "${aws_api_gateway_method.proxy.resource_id}"
  http_method = "${aws_api_gateway_method.proxy.http_method}"
  integration_http_method = "POST"
  type = "AWS_PROXY"
  uri = "${var.arn}"
}

resource "aws_api_gateway_method" "proxy_root" {
  rest_api_id = "${aws_api_gateway_rest_api.api_gateweay_techchallenge.id}"
  resource_id = "${aws_api_gateway_rest_api.api_gateweay_techchallenge.root_resource_id}"
  http_method = "ANY"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "lambda_root" {
  rest_api_id = "${aws_api_gateway_rest_api.api_gateweay_techchallenge.id}"
  resource_id = "${aws_api_gateway_method.proxy_root.resource_id}"
  http_method = "${aws_api_gateway_method.proxy_root.http_method}"
  integration_http_method = "POST"
  type = "AWS_PROXY"
  uri = "${var.arn}"
}

resource "aws_api_gateway_deployment" "gateway_deployment" {
  depends_on = [
    aws_api_gateway_integration.lambda,
    aws_api_gateway_integration.lambda_root,
  ]
  rest_api_id = "${aws_api_gateway_rest_api.api_gateweay_techchallenge.id}"
  stage_name = var.environment
}

resource "aws_lambda_permission" "apigw_lambda" {
  statement_id = "AllowAPIGatewayInvoke"
  action = "lambda:InvokeFunction"
  function_name = var.function_name
  principal = "apigateway.amazonaws.com"
  # More: http://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-control-access-using-iam-policies-to-invoke-api.html
  source_arn = "${aws_api_gateway_rest_api.api_gateweay_techchallenge.execution_arn}/*/*"
}