variable "region" {
  description = "AWS region"
  default     = "ap-southeast-2"
}

variable "environment" {
  description = "Deployment environment"
  default     = "dev"
}

variable "project" {
  description = "Project name"
  default     = "devops-project"
}

variable "db_user" {}

variable "db_name" {}