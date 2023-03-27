terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

locals {
  lambda_path     = "${path.root}/lambda"
  lambda_zip_path = "${path.root}/lambda.zip"
}

resource "aws_s3_bucket" "website_bucketabcolavgaute123yes" {
  bucket        = "website-fylke-bucket-1abcolavgaute123yes"
  force_destroy = true
}

resource "aws_s3_bucket_website_configuration" "bucket_website_config" {
  bucket = aws_s3_bucket.website_bucketabcolavgaute123yes.id

  index_document {
    suffix = "index.html"
  }

}

resource "aws_s3_bucket_public_access_block" "bucket_public_access" {
  bucket = aws_s3_bucket.website_bucketabcolavgaute123yes.id
}

resource "aws_s3_bucket_policy" "allow_public_access" {
  bucket = aws_s3_bucket.website_bucketabcolavgaute123yes.id
  policy = data.aws_iam_policy_document.allow_public_access.json
}

data "aws_iam_policy_document" "allow_public_access" {
  statement {

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    actions = [
      "s3:GetObject"
    ]

    resources = [
      aws_s3_bucket.website_bucketabcolavgaute123yes.arn,
      "${aws_s3_bucket.website_bucketabcolavgaute123yes.arn}/*",
    ]
  }
}

resource "aws_apigatewayv2_api" "fylke-api" {
  name          = "fylke-api"
  protocol_type = "HTTP"
  target        = aws_lambda_function.lambda-fylke.arn

  cors_configuration {
    allow_headers = ["content-type", "x-amz-date", "authorization", "x-api-key", "x-amz-security-token", "x-amz-user-agent"]
    allow_methods = ["*"]
    allow_origins = ["*"]
  }
}

resource "aws_apigatewayv2_route" "get-fylke-route" {
  api_id    = aws_apigatewayv2_api.fylke-api.id
  route_key = "GET /getFylker"
  target    = "integrations/${aws_apigatewayv2_integration.get-fylke-integration.id}"
}

data "archive_file" "fylke-lambda-code" {
  type = "zip"

  source_dir  = local.lambda_path
  output_path = local.lambda_zip_path
}

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

resource "aws_iam_role" "iam_for_lambda" {
  name               = "iam_for_fylke_lambda"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy_attachment" "basic" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  role       = aws_iam_role.iam_for_lambda.name
}

resource "aws_lambda_function" "lambda-fylke" {
  filename      = local.lambda_zip_path
  function_name = "fylke-lambda"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "index.handler"

  runtime = "nodejs16.x"
}

resource "aws_apigatewayv2_integration" "get-fylke-integration" {
  api_id           = aws_apigatewayv2_api.fylke-api.id
  integration_type = "AWS_PROXY"

  description        = "Lambda providing fylker"
  integration_method = "POST"
  integration_uri    = aws_lambda_function.lambda-fylke.invoke_arn
}

resource "aws_lambda_permission" "lambda_permission_invoke_grant" {
    statement_id  = "AllowAPIGatewayInvoke"
    action        = "lambda:InvokeFunction"
    function_name = aws_lambda_function.lambda-fylke.function_name
    principal     = "apigateway.amazonaws.com"
    source_arn    = "${aws_apigatewayv2_api.fylke-api.execution_arn}/*"
}

output "apigw_endpoint" {
  value = aws_apigatewayv2_api.fylke-api.api_endpoint
  description = "Endpoint for the HTTP API."
}

output "website_url" {
  value = aws_s3_bucket_website_configuration.bucket_website_config.website_endpoint
  description = "Endpoint for the S3 bucket static website."
}

output "bucket_name" {
  value = aws_s3_bucket.website_bucketabcolavgaute123yes.id
  description = "Name of the website bucket."
}