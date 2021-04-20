# terraform-aws-rds-schema-and-user
TF module to create a Schema on RDS Aurora and generate random username and password and write to a secret.

## Example usage:

``` Terraform
module "rds" {
  source   = "../rds"

  rds_name              = "example-schema"
  rds_cluster_host      = var.rds_cluster_host
  rds_cluster_name      = var.rds_cluster_name
  rds_cluster_port      = var.rds_cluster_port
  default_character_set = "utf8mb4"
  default_collation     = "utf8mb4_unicode_ci"

  tags = var.tags
}
```