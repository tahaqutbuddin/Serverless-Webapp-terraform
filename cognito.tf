# # Create SES resource 
# resource "aws_ses_email_identity" "ses_email" {
#   email = var.ses_email
# }

# resource "aws_cognito_user_pool" "user_login_pool" {
#   name              = var.cognito_pool
#   mfa_configuration = "OFF"
#   username_attributes =  var.cognito_verified_attributes
#   auto_verified_attributes = var.cognito_verified_attributes
#   deletion_protection = "INACTIVE"
  
#   username_configuration {
#     case_sensitive = false
#   }

#   password_policy {
#     minimum_length                   = 10
#     require_lowercase                = true
#     require_numbers                  = true
#     require_symbols                  = true
#     require_uppercase                = true
#     temporary_password_validity_days = 2
#   }

#   account_recovery_setting {
#     recovery_mechanism {
#       name     = "verified_email"
#       priority = 1
#     }
#   }

#   user_attribute_update_settings {
#     attributes_require_verification_before_update = var.cognito_verified_attributes
#   }

#   email_configuration {
#     email_sending_account = "DEVELOPER"
#     from_email_address    = "${var.ses_name} <${var.ses_email}>"
#     source_arn            = aws_ses_email_identity.ses_email.arn
#   }

#   schema {
#       name = "email"
#       attribute_data_type = "String"
#       mutable = true
#       required = true
#       developer_only_attribute = false
#       string_attribute_constraints {
#         min_length = 1
#         max_length = 2048
#       }
#   }

#   tags = {
#     project = var.tag
#   }
# }

# resource "aws_cognito_user_pool_client" "user_pool_client" {
#   name                          = var.cognito_pool_client
#   user_pool_id                  = aws_cognito_user_pool.user_login_pool.id
#   prevent_user_existence_errors = "ENABLED"
#   explicit_auth_flows           = ["ALLOW_CUSTOM_AUTH", "ALLOW_USER_SRP_AUTH", "ALLOW_REFRESH_TOKEN_AUTH"]
# }
