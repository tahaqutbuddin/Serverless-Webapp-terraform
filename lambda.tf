data "archive_file" "lambda" {
  type        = "zip"
  source_file = "wildrydes-site/js/requestUnicorn.js"
  output_path = "lambda_function_payload.zip"
}


resource "aws_lambda_function" "wildrydes_lambda" {
  filename      = "lambda_function_payload.zip"
  function_name = "RequestUnicorn"
  role          = aws_iam_role.lambdaRole.arn
  handler       = "index.handler"
  architectures = ["x86_64"]
  runtime       = "nodejs16.x"
}

# resource "aws_lambda_permission" "lambda_permission" {
#   statement_id  = "AllowMyDemoAPIInvoke"
#   action        = "lambda:InvokeFunction"
#   function_name = "MyDemoFunction"
#   principal     = "apigateway.amazonaws.com"

#   # The /* part allows invocation from any stage, method and resource path
#   # within API Gateway.
#   source_arn = "${aws_api_gateway_rest_api.wildrydes_api.execution_arn}/*"
# }