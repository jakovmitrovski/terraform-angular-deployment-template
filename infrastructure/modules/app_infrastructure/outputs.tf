output "bucket_id" {
  value       = aws_s3_bucket.bucket.id
  description = "Bucket ID"
}

output "distribution_id" {
  value       = aws_cloudfront_distribution.s3_distribution.id
  description = "Cloudfront Distribution ID"
}