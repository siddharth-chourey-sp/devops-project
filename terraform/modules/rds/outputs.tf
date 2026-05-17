output "db_endpoint" {
  value = aws_db_instance.rds.endpoint
}

output "db_secrets_arn" {
  value = aws_db_instance.rds.master_user_secret[0].secret_arn
}