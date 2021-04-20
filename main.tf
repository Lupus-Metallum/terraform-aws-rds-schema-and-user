resource "random_password" "db_user_pass" {
  length           = 16
  special          = true
  min_special      = 1
  min_numeric      = 2
  min_lower        = 5
  min_upper        = 5
  override_special = "!"
}

resource "random_string" "db_user" {
  length  = 8
  special = false
  upper   = false
}

resource "mysql_database" "db_schema" {
  name                  = var.rds_name
  default_character_set = var.default_character_set
  default_collation     = var.default_collation

  # lifecycle {
  #   prevent_destroy = true
  # }
}

resource "mysql_user" "db_username" {
  user               = random_string.db_user.result
  host               = "%"
  plaintext_password = random_password.db_user_pass.result
}


resource "mysql_grant" "db_user_grant" {
  user       = mysql_user.db_username.user
  host       = "%"
  database   = mysql_database.db_schema.name
  privileges = ["ALL"]
}

locals {
  secret = {
    dbInstanceIdentifier = var.rds_cluster_name
    engine               = "aurora"
    host                 = var.rds_cluster_host
    port                 = var.rds_cluster_port
    username             = mysql_user.db_username.user
    password             = random_password.db_user_pass.result
    dbName               = mysql_database.db_schema.name
  }
}

resource "aws_secretsmanager_secret" "dbsecret" {
  name = "rds-db-credentials/${var.rds_cluster_name}/${var.rds_name}"

  tags = var.tags
}

resource "aws_secretsmanager_secret_version" "dbsecretvalue" {
  secret_id     = aws_secretsmanager_secret.dbsecret.id
  secret_string = jsonencode(local.secret)
}