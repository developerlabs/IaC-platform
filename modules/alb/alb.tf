module "alb" {
  source = "github.com/imSold/IaC-ALB?ref=master"

  aws_ssl_certificate_arn_id  = "${var.aws_ssl_certificate_arn_id}"
  hosted_zone_id              = "${var.hosted_zone_id}"
  domain_name                 = "${var.domain_name}"

  pre_tag         = "${var.pre_tag}"
  post_tag        = "${var.post_tag}"
  tag_service     = "${var.tag_service}"
  tag_environment = "${var.tag_service}"
  tag_version     = "${var.tag_version}"
  vpc_id          = "${var.vpc_id}"

  public_agent_asg_desired_capacity = "${var.public_agent_asg_desired_capacity}"

  public_agent_ids            = "${module.dcos.public_agent_ids}"
  public_primary_subnet_id    = "${module.dcos.public_primary_subnet_id}"
  public_secondary_subnet_id  = "${module.dcos.public_secondary_subnet_id}"
  public_security_group_id    = "${module.dcos.public_security_group_id}"

  alb_domain        = "${var.alb_domain}"
  alb_health_path   = "${var.alb_health_path}"
  alb_health_port   = "${var.alb_health_port}"
  alb_name          = "${var.alb_name}"
  alb_service_port  = "${var.alb_service_port}"
}
