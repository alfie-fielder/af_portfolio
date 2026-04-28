locals {
  environments = toset(["dev", "prod"])
}

resource "aws_s3_bucket" "tf_state" {
  for_each = local.environments

  bucket = "${var.project_prefix}-tf-state-${each.key}"

  tags = {
    Environment = each.key
    ManagedBy   = "terraform"
    Purpose     = "terraform-state"
  }
}

resource "aws_s3_bucket_versioning" "tf_state" {
  for_each = aws_s3_bucket.tf_state

  bucket = each.value.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "tf_state" {
  for_each = aws_s3_bucket.tf_state

  bucket = each.value.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "tf_state" {
  for_each = aws_s3_bucket.tf_state

  bucket                  = each.value.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_dynamodb_table" "tf_state_lock" {
  for_each = local.environments

  name         = "${var.project_prefix}-tf-state-lock-${each.key}"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Environment = each.key
    ManagedBy   = "terraform"
    Purpose     = "terraform-state-lock"
  }
}
