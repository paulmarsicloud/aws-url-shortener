resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

  inline_policy {
    name = "url_lambda_permissions"

    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Action   = ["s3:ListAllMyBuckets"]
          Effect   = "Allow"
          Resource = "*"
        },
        {
          Action   = ["s3:ListBucket", "s3:GetBucketLocation"]
          Effect   = "Allow"
          Resource = "arn:aws:s3:::${var.domain_name}"
        },
        {
          Action   = ["s3:PutObject", "s3:PutObjectAcl", "s3:GetObject", "s3:GetObjectAcl", "s3:DeleteObject"]
          Effect   = "Allow"
          Resource = "arn:aws:s3:::${var.domain_name}/*"
        },
        {
          Action   = ["logs:CreateLogGroup"]
          Effect   = "Allow"
          Resource = "arn:aws:logs:us-east-1:${data.aws_caller_identity.this.account_id}:*"
        },
        {
          Action   = ["logs:CreateLogStream", "logs:PutLogEvents"]
          Effect   = "Allow"
          Resource = "arn:aws:logs:us-east-1:${data.aws_caller_identity.this.account_id}:log-group:/aws/lambda/url_shortener"
        }
      ]
    })
  }


  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}
