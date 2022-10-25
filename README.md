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
<!-- BEGIN_TF_DOCS -->

<img src="https://raw.githubusercontent.com/Lupus-Metallum/brand/master/images/logo.jpg" width="400"/>

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_mysql"></a> [mysql](#provider\_mysql) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_secretsmanager_secret.dbsecret](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret) | resource |
| [aws_secretsmanager_secret_version.dbsecretvalue](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_version) | resource |
| [mysql_database.db_schema](https://registry.terraform.io/providers/terraform-providers/mysql/latest/docs/resources/database) | resource |
| [mysql_grant.db_user_grant](https://registry.terraform.io/providers/terraform-providers/mysql/latest/docs/resources/grant) | resource |
| [mysql_user.db_username](https://registry.terraform.io/providers/terraform-providers/mysql/latest/docs/resources/user) | resource |
| [random_password.db_user_pass](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [random_string.db_user](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_rds_cluster_host"></a> [rds\_cluster\_host](#input\_rds\_cluster\_host) | The shared DB cluster DNS hostname that this tenant runs on | `string` | n/a | yes |
| <a name="input_rds_cluster_name"></a> [rds\_cluster\_name](#input\_rds\_cluster\_name) | The shared DB cluster that this tenant runs on | `string` | n/a | yes |
| <a name="input_rds_cluster_port"></a> [rds\_cluster\_port](#input\_rds\_cluster\_port) | The shared DB cluster port that this tenant runs on | `string` | n/a | yes |
| <a name="input_rds_name"></a> [rds\_name](#input\_rds\_name) | The Name of the Tenant to embed in resouces | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | default map of tags | `map(string)` | n/a | yes |
| <a name="input_default_character_set"></a> [default\_character\_set](#input\_default\_character\_set) | The default character set to apply to the schema | `string` | `"utf8"` | no |
| <a name="input_default_collation"></a> [default\_collation](#input\_default\_collation) | The default collation to apply to the schema | `string` | `"utf8_general_ci"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_secret_arn"></a> [secret\_arn](#output\_secret\_arn) | n/a |
| <a name="output_secret_name"></a> [secret\_name](#output\_secret\_name) | n/a |
<!-- END_TF_DOCS -->