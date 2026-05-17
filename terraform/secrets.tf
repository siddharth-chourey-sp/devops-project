# resource "aws_secretsmanager_secret" "rds" {
#   name                    = "prod/db/credentials"
#   recovery_window_in_days = 0

#   tags = {
#     Project     = var.project
#     Environment = var.environment
#     ManagedBy   = "Terraform"
#   }
# }

# resource "aws_secretsmanager_secret_version" "rds_value" {
#   secret_id = aws_secretsmanager_secret.rds.id

#   secret_string = jsonencode({
#     DB_HOST     = module.rds.db_endpoint
#     DB_USER     = var.db_user
#     DB_PASSWORD = random_password.db_password.result
#     DB_NAME     = var.db_name
#   })
# }