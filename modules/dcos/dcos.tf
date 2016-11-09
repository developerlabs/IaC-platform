module "dcos" {
  source = "github.com/microservices-today/IaC-dcos?ref=master"

  aws_region      = "${var.aws_region}"
  pre_tag         = "${var.pre_tag}"
  post_tag        = "${var.post_tag}"
  tag_service     = "${var.tag_service}"
  tag_environment = "${var.tag_service}"
  tag_version     = "${var.tag_version}"

  vpc_id              = "${var.vpc_id}"
  internet_gateway_id = "${var.internet_gateway_id}"

  aws_ssl_certificate_arn_id = "${var.aws_ssl_certificate_arn_id}"

  key_pair_name                     = "${var.key_pair_name}"
  master_user_data                  = "${var.master_user_data}"
  dcos_master_count                 = "${var.dcos_master_count}"
  agent_asg_desired_capacity        = "${var.agent_asg_desired_capacity}"
  public_agent_asg_desired_capacity = "${var.public_agent_asg_desired_capacity}"

  hosted_zone_id = "${var.hosted_zone_id}"
  domain_name    = "${var.domain_name}"

  dcos_edition       = "${var.dcos_edition}"
  dcos_cluster_name  = "${var.dcos_cluster_name}"
  dcos_timezone      = "${var.dcos_timezone}"
  dcos_installer_url = "${var.dcos_installer_url}"

  sysdig_access_key = "${var.sysdig_access_key}"
}
