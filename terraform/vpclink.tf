resource "aws_api_gateway_vpc_link" "vpc_link" {
  name        = "tech-challenge-vpc-link"
  description = "example description"
  target_arns = [data.aws_lb.nlb.arn]
}
