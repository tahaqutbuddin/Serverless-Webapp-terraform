variable "region" {
  type        = string
  default     = "us-east-1"
  description = "Region for deploying resources"
}

variable "github_repo" {
  type        = string
  description = "Referencing github Repo for static code"
}

variable "github_access_token" {
  type        = string
  description = "Referencing my personal access token of github"
}