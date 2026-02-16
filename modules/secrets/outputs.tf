output "secret_arn" {
  value = aws_secretsmanager_secret.db.arn
}

output "username" {
  value = "proshop"
}

output "password" {
  value     = random_password.db.result
  sensitive = true
}
