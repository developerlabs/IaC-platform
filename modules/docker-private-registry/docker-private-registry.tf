module "docker-registry" {
  source = "github.com/microservices-today/IaC-dcos-docker-registry?ref=master"

  bootstrap_ip   = "${module.dcos.bootstrap_ip}"
  agent_ips      = "${module.dcos.agent_ips}"
  agent_count    = "${module.dcos.agent_count}"
  aws_region     = "${var.aws_region}"
  s3_bucket_name = "${module.dcos.s3_bucket_name}"

  pre_tag         = "${var.pre_tag}"
  post_tag        = "${var.post_tag}"
  tag_service     = "${var.tag_service}"
  tag_environment = "${var.tag_service}"
  tag_version     = "${var.tag_version}"

  dcos_url        = "${module.dcos.dcos_url}"
}
