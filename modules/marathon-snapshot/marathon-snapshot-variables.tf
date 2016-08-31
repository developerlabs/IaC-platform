/**
 * IaC : maraton-snapshot
 */

variable "marathon_snapshot_dcos_config" {
  description = "DCOS configuration files"
  default = "templates/dcos-config.json"
}
variable "marathon_snapshot_s3_config" {
  description = "s3 configuration files"
  default = "templates/s3-config.json"
}
variable "marathon_snapshot_dcos_env" {
  description = "The folder under which the backup will be stored in S3"
}
variable "marathon_snapshot_backup_s3_bucket_name" {}
