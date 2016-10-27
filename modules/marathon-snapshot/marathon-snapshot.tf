module "maraton-snapshot" {
  source = "github.com/microservices-today/IaC-marathon-snapshots.git?ref=master"

  aws_region                  = "${var.aws_region}"
  private_security_group_id   = "${module.dcos.private_security_group_id}"
  private_primary_subnet_id   = "${module.dcos.private_primary_subnet_id}"
  private_secondary_subnet_id = "${module.dcos.private_secondary_subnet_id}"
  pre_tag                     = "${var.pre_tag}"
  post_tag                    = "${var.post_tag}"

  backup_s3_bucket_name = "${module.dcos.s3_bucket_name}"

  dcos_url = "${module.dcos.dcos_url}"
}
