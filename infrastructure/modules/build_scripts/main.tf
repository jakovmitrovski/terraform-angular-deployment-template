resource "null_resource" "build_app" {
  provisioner "local-exec" {
    working_dir = "../source-code"
    command     = "npm install && ng b --extract-licenses false --output-path ../source-code/dist"
  }

  triggers = {
    always_run = timestamp()
  }
}

resource "null_resource" "app_dist" {
  provisioner "local-exec" {
    command = "aws --profile ${var.aws_profile} s3 sync ../source-code/dist s3://${var.bucket_name}/"
  }

  triggers = {
    always_run = timestamp()
  }

  depends_on = [null_resource.build_app]
}

resource "null_resource" "cf_invalidation" {
  provisioner "local-exec" {
    command = "aws --profile ${var.aws_profile} cloudfront create-invalidation --distribution-id ${var.s3_distribution_id} --paths '/*'"
  }

  triggers = {
    always_run = timestamp()
  }

  depends_on = [null_resource.app_dist]
}