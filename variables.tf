variable "region" {
  type        = string
  default     = "us-east-1"
  description = "Region for deploying resources"
  validation {
    condition     = can(regex("[a-z][a-z]-[a-z]+-[1-9]", var.region))
    error_message = "Must be valid AWS Region names."
  }
}

variable "accountId" {
  type     = number
  nullable = false
}

variable "tag" {
  type        = string
  default     = "terraform"
  description = "This tag would be used for all resources developed within this project"
}

# AWS Amplify variables
variable "github_repo" {
  type        = string
  description = "Referencing github Repo for static code"
  validation {
    condition     = startswith(var.github_repo, "https://")
    error_message = "Github_repo should start with https://"
  }
}

variable "github_access_token" {
  type        = string
  description = "Referencing my personal access token of github"
}


# AWS SES
variable "ses_name" {
  type        = string
  description = "Name to use for SES"
}

variable "ses_email" {
  type        = string
  description = "Email to use for SES"
}

# AWS Cognito
variable "cognito_pool" {
  type        = string
  description = "Name for AWS Cognito User pool"
}

variable "cognito_pool_client" {
  type        = string
  description = "Name for AWS Cognito User pool's Client App"
}

variable "cognito_verified_attributes" {
  type = list(string)
}

