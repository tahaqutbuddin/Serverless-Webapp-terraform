data "aws_iam_policy_document" "lambda_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "lambdaRole" {
  name               = "WildRydesLambda"
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role_policy.json

  inline_policy {
    name = "DynamoDBWriteAccess"
    policy = jsonencode({
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Sid" : "IAMPolicy01",
          "Effect" : "Allow",
          "Action" : "dynamodb:PutItem",
          "Resource" : "${aws_dynamodb_table.rides_table.arn}"
        }
      ]
    })
  }

  tags = {
    project = var.tag
  }
}

resource "aws_iam_role_policy_attachment" "lambda_role_attachment" {
  role       = aws_iam_role.lambdaRole.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}