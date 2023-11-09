# resource "aws_amplify_app" "terraformSite" {
#   name                        = "StaticSite"
#   repository                  = var.github_repo
#   access_token                = var.github_access_token //for github repo add access_token
#   enable_auto_branch_creation = true
#   enable_branch_auto_build = true
#   custom_rule {
#     source = "/<*>"
#     status = "404"
#     target = "/index.html"
#   }
# }

# resource "aws_amplify_branch" "master" {
#   app_id            = aws_amplify_app.terraformSite.id
#   branch_name       = "master"
#   stage             = "DEVELOPMENT"
#   enable_auto_build = true
#   tags = {
#     "tutorial" = "static-site"
#   }
# }