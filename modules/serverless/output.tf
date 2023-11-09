output "lambda_function_name" {
  description = "The lambda function name Output"
  value = aws_lambda_function.techchallenge_function.function_name
}

output "lambda_invoke_arn" {
  description = "The arn of lambda to create api gateway Output"
  value = aws_lambda_function.techchallenge_function.invoke_arn
}