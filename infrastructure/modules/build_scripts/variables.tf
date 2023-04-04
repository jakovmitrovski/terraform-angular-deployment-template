variable "aws_profile" {
  description = "AWS profile to use"
  type        = string
}

variable "s3_distribution_id" {
  description = "CloudFront distribution ID"
  type        = string
}

variable "app_name" {
  description = "Name of the application"
  type        = string
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}