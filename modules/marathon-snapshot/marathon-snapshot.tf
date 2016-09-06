module "maraton-snapshot" {
  source = "github.com/microservices-today/IaC-marathon-snapshots.git?ref=master"

  region = "${var.aws_region}"
  backup_s3_bucket_name = "${var.marathon_snapshot_backup_s3_bucket_name}"
  s3_config = "${var.marathon_snapshot_s3_config}"

  dcos_url = "${module.dcos.dcos_url}"
  pre_tag = "${var.pre_tag}"
  post_tag = "${var.post_tag}"
  dcos_url_token = "${module.dcos.dcos_acs_token}"
  dcos_config = "${var.marathon_snapshot_dcos_config}"
  dcos_env = "${var.marathon_snapshot_dcos_env}"
}
