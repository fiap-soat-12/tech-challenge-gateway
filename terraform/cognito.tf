resource "aws_cognito_user_pool" "user_pool" {
  name = "tech-challenge-user-pool"

  username_attributes = ["email"]
}

resource "aws_cognito_user_pool_domain" "cognito_domain" {
  domain       = "tech-challenge-domain"
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
  name                                 = "tech-challenge-client"
  user_pool_id                         = aws_cognito_user_pool.user_pool.id
  generate_secret                      = true
  allowed_oauth_flows_user_pool_client = true
  prevent_user_existence_errors        = "ENABLED"
  supported_identity_providers         = ["COGNITO"]
  explicit_auth_flows                  = ["ALLOW_USER_PASSWORD_AUTH", "ALLOW_REFRESH_TOKEN_AUTH"]
  allowed_oauth_flows                  = ["implicit"]
  allowed_oauth_scopes                 = ["email", "openid"]

  callback_urls = ["https://example.com"]
}

