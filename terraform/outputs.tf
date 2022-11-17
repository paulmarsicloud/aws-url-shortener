output "lambda_url" {
  value = aws_lambda_function_url.lambda_url.function_url
}

output "lambda_function_name" {
  value = aws_lambda_function.lambda_function.function_name
}
