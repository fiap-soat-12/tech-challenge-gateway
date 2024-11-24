resource "aws_api_gateway_rest_api" "web_api" {
  name = "tech-challenge-api"

  body = templatefile("${path.module}/openapi/tech-challenge-api-definition.json", {
    lb_dns_name    = data.aws_lb.nlb.dns_name
    vpc_link_id    = aws_api_gateway_vpc_link.vpc_link.id
    authorizer_uri = "arn:aws:apigateway:${var.aws_region}:lambda:path/2015-03-31/functions/${data.aws_lambda_function.lambda_authorizer.arn}/invocations"
  })

  binary_media_types = ["*/*"]
}

resource "aws_api_gateway_deployment" "web_api_deployment" {
  rest_api_id = aws_api_gateway_rest_api.web_api.id

  depends_on = [aws_api_gateway_rest_api.web_api]
}

resource "aws_api_gateway_stage" "web_api_stage" {
  rest_api_id   = aws_api_gateway_rest_api.web_api.id
  deployment_id = aws_api_gateway_deployment.web_api_deployment.id
  stage_name    = "techchallenge"

  depends_on = [aws_api_gateway_deployment.web_api_deployment]
}
