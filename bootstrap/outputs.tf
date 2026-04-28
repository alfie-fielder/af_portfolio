output "state_bucket_names" {
  description = "S3 bucket names per environment — use these in backend.tf files"
  value       = { for env, bucket in aws_s3_bucket.tf_state : env => bucket.id }
}

output "state_lock_table_names" {
  description = "DynamoDB table names per environment — use these in backend.tf files"
  value       = { for env, table in aws_dynamodb_table.tf_state_lock : env => table.name }
}
