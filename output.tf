output "secret_arn" {
  value = aws_secretsmanager_secret.dbsecret.arn
}
output "secret_name" {
  value = aws_secretsmanager_secret.dbsecret.name
}