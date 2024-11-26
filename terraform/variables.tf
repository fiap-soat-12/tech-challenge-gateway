variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "AWS Account region"
}

variable "vpc_name" {
  type = string
  default = "tech-challenge-vpc"
  description = "Custom VPC name"
}

variable "nlb_name" {
  type = string
  default = "techchallenge-nlb"
  description = "Network Load Balancer name"
}

variable "lambda_authorizer_name" {
  type = string
  default = "my_lambda"
  description = "Lambda Authorizer name"
}

