variable "aws_region" {
  description = "The AWS region for deployment"
  default     = "eu-central-1"
  type        = string
}

variable "aws_profile" {
  description = "The AWS CLI profile to be used"
  default     = "default"
  type        = string
}

variable "app_name" {
  description = "The name of the application"
  default     = "tftry"
  type        = string
}

variable "certificate_arn" {
  description = "The ARN of the certificate to use"
  default     = ""
  type        = string
}
variable "domain_name" {
  description = "The domain name to use"
  default     = ""
  type        = string
}