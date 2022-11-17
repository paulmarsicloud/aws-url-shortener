resource "aws_lambda_function" "lambda_function" {
  function_name = "url_shortener"
  filename      = "../lambda/dist/lambda.zip"
  description   = "Lambda that creates URL redirects via empty S3 objects"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "index.handler"
  runtime       = "nodejs16.x"
  timeout       = 20
}

resource "aws_lambda_function_url" "lambda_url" {
  function_name      = aws_lambda_function.lambda_function.function_name
  authorization_type = "NONE"

  cors {
    allow_credentials = true
    allow_origins     = ["http://${var.domain_name}"]
    allow_methods     = ["*"]
    allow_headers     = ["date", "keep-alive"]
    expose_headers    = ["keep-alive", "date"]
    max_age           = 86400
  }
}
