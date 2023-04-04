variable "app_name" {
  default     = "app"
  type        = string
  description = "The name of the application"
}

variable "aws_region" {
  description = "The AWS region for deployment"
  default     = "eu-central-1"
  type        = string
}

variable "profile" {
  description = "The AWS profile name for deployment"
  default     = "default"
  type        = string
}