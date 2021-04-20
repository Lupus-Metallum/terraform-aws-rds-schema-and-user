variable "rds_name" {
  description = "The Name of the Tenant to embed in resouces"
  type        = string
}

variable "rds_cluster_name" {
  description = "The shared DB cluster that this tenant runs on"
  type        = string
}

variable "rds_cluster_port" {
  description = "The shared DB cluster port that this tenant runs on"
  type        = string
}

variable "rds_cluster_host" {
  description = "The shared DB cluster DNS hostname that this tenant runs on"
  type        = string
}

variable "default_character_set" {
  description = "The default character set to apply to the schema"
  type        = string
  default     = "utf8"
}

variable "default_collation" {
  description = "The default collation to apply to the schema"
  type        = string
  default     = "utf8_general_ci"
}

variable "tags" {
  description = "default map of tags"
  type        = map(string)
}