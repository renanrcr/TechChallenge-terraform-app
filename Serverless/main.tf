# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function
data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_lambda_function" "techchallenge_function" {
  function_name = "techchallenge_function_auth"
  s3_bucket = var.bucket_name
  s3_key = "TechChallengeLambdaAuth.zip"
  handler = var.handler
  runtime = var.runtime
  role = aws_iam_role.lambda_exec.arn
  tags = {
    Name = "techchallenge-auth"
  }
}

# IAM role which dictates what other AWS services the Lambda function
# may access.
resource "aws_iam_role" "lambda_exec" {
  name = "iam_for_lambda_role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}