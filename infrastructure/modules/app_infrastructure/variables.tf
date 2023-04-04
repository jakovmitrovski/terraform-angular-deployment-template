variable "bucket_name" {
  description = "The name of the bucket where the website code will be stored"
  type        = string
}

variable "certificate_arn" {
  description = "The arn of the SSL certificate to allow https access to the page"
  type        = string
}

variable "domain_name" {
  description = "The domain name of the application"
  type        = string
}