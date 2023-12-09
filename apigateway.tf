resource "aws_api_gateway_rest_api" "wildrydes_api" {
  name = "WildRydes"

  endpoint_configuration {
    types = ["EDGE"]
  }
}

#setting up authorizer for authenticating request using cognito
resource "aws_api_gateway_authorizer" "demo" {
  name            = "WildRydes"
  type            = "COGNITO_USER_POOLS"
  identity_source = "method.request.header.Authorization"
  rest_api_id     = aws_api_gateway_rest_api.wildrydes_api.id
  provider_arns   = [aws_cognito_user_pool.user_login_pool.arn]
}

resource "aws_api_gateway_resource" "root" {
  rest_api_id = aws_api_gateway_rest_api.wildrydes_api.id
  parent_id   = aws_api_gateway_rest_api.wildrydes_api.root_resource_id
  path_part   = "ride"
}


resource "aws_api_gateway_method" "requestUnicorn" {
  rest_api_id   = aws_api_gateway_rest_api.wildrydes_api.id
  resource_id   = aws_api_gateway_resource.root.id
  http_method   = "POST"
  authorization = "COGNITO_USER_POOLS"
  authorizer_id = aws_api_gateway_authorizer.demo.id
}

resource "aws_api_gateway_integration" "lambda_integration" {
  rest_api_id             = aws_api_gateway_rest_api.wildrydes_api.id
  resource_id             = aws_api_gateway_resource.root.id
  http_method             = aws_api_gateway_method.requestUnicorn.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.wildrydes_lambda.invoke_arn
  timeout_milliseconds    = 28000
}

resource "aws_api_gateway_method_response" "requestUnicorn_response" {
  rest_api_id = aws_api_gateway_rest_api.wildrydes_api.id
  resource_id = aws_api_gateway_resource.root.id
  http_method = aws_api_gateway_method.requestUnicorn.http_method
  status_code = "200"
}

resource "aws_api_gateway_integration_response" "proxy" {
  rest_api_id = aws_api_gateway_rest_api.wildrydes_api.id
  resource_id = aws_api_gateway_resource.root.id
  http_method = aws_api_gateway_method.requestUnicorn.http_method
  status_code = aws_api_gateway_method_response.requestUnicorn_response.status_code

  depends_on = [
    aws_api_gateway_method.requestUnicorn,
    aws_api_gateway_integration.lambda_integration
  ]
}