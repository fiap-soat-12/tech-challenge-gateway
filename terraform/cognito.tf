resource "random_id" "hex_string" {
  byte_length = 8
}

resource "aws_cognito_user_pool" "user_pool" {
  name                     = "tech-challenge-user-pool"
  auto_verified_attributes = ["email"]

  username_attributes = ["email"]
}

resource "aws_cognito_user_pool_domain" "cognito_domain" {
  domain       = "tech-challenge-domain-${random_id.hex_string.hex}"
  user_pool_id = aws_cognito_user_pool.user_pool.id
}

resource "aws_cognito_resource_server" "gateway_scope" {
  identifier   = aws_api_gateway_stage.web_api_stage.invoke_url
  name         = "tech-challenge-gateway-resource"
  user_pool_id = aws_cognito_user_pool.user_pool.id

  scope {
    scope_name        = "read"
    scope_description = "Read access to resources"
  }

  scope {
    scope_name        = "write"
    scope_description = "Write access to resources"
  }
}

resource "aws_cognito_user_pool_client" "user_pool_client" {
  name            = "tech-challenge-client"
  user_pool_id    = aws_cognito_user_pool.user_pool.id
  generate_secret = true

  allowed_oauth_flows_user_pool_client = true
  allowed_oauth_flows                  = ["implicit"]
  allowed_oauth_scopes                 = ["email", "openid"]

  prevent_user_existence_errors = "ENABLED"
  supported_identity_providers  = ["COGNITO"]
  explicit_auth_flows           = ["ALLOW_USER_PASSWORD_AUTH", "ALLOW_REFRESH_TOKEN_AUTH"]

  callback_urls = ["https://fiap-soat-12.github.io/fiap-soat-tech-challenge-api/"]
}

resource "null_resource" "update_lambda_environment" {
  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = <<EOT
      aws lambda update-function-configuration \
        --function-name "${var.lambda_authorizer_name}" \
        --environment "Variables={USER_POOL_ID=${aws_cognito_user_pool.user_pool.id}}"
    EOT
  }
}
