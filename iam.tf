# resource "aws_iam_role" "lambdaRole" {
#   name = "lambdaRole"
#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Action = "sts:AssumeRole"
#         Effect = "Allow"
#         Sid    = ""
#         Principal = {
#           Service = "ec2.amazonaws.com"
#         }
#       },
#     ]
#   })

#   inline_policy {
#     name = "DynamoDBWriteAccess"

#     policy = jsonencode({
#       "Version" : "2012-10-17",
#       "Statement" : [
#         {
#           "Sid" : "VisualEditor0",
#           "Effect" : "Allow",
#           "Action" : "dynamodb:PutItem",
#           "Resource" : "arn:aws:dynamodb:ap-southeast-2:355385224066:table/Rides"
#         }
#       ]
#     })
#   }

#   tags = {
#     tag-key = "tag-value"
#   }
# }