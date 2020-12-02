provider "aws" {
  region = "us-east-2"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "kevin-terraform-state"

  #prevent accidental deletion of this s3 bucket
  lifecycle {
    prevent_destroy = true
  }

  #enable versioning so we can see the full revision history of our state files
  versioning {
    enabled = true
  }

  #enable server-side encryption by default
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}
