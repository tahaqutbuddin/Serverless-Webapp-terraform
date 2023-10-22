resource "aws_amplify_app" "terraformSite" {
  name         = "StaticSite"
  repository   = var.github_repo
  access_token = var.github_access_token //for github repo add access_token
  custom_rule {
    source = "/<*>"
    status = "404"
    target = "/index.html"
  }
}

resource "aws_amplify_branch" "master" {
  app_id            = aws_amplify_app.terraformSite.id
  branch_name       = "master"
  stage             = "DEVELOPMENT"
  enable_auto_build = true
  tags = {
    "tutorial" = "static-site"
  }
}

resource "aws_amplify_domain_association" "amplify_domain" {
  app_id                = aws_amplify_app.terraformSite.id
  domain_name           = "awsamplifyapp.com"
  wait_for_verification = false
  sub_domain {
    branch_name = aws_amplify_branch.master.branch_name
    prefix      = "master"
  }
}