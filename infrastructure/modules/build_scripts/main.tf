locals {
  mime_types = {
    ".html" = "text/html"
    ".css"  = "text/css"
    ".js"   = "application/javascript"
    ".ico"  = "image/vnd.microsoft.icon"
    ".jpeg" = "image/jpeg"
    ".png"  = "image/png"
    ".svg"  = "image/svg+xml"
  }
}

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
    dist_changed = null_resource.build_app.id
  }

  depends_on = [null_resource.build_app]
}

resource "null_resource" "cf_invalidation" {
  provisioner "local-exec" {
    command = "aws --profile ${var.aws_profile} cloudfront create-invalidation --distribution-id ${var.s3_distribution_id} --paths '/*'"
  }

  triggers = {
    dist_changed = null_resource.app_dist.id
  }

  depends_on = [null_resource.app_dist]
}