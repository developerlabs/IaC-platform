module "openvpn" {
  source = "github.com/microservices-today/IaC-openvpn?ref=master"

  aws_region           = "${var.aws_region}"
  vpc_id               = "${var.vpc_id}"
  vpc_cidr             = "${var.vpc_cidr}"
  management_subnet_id = "${var.management_subnet_id}"
  key_pair_name        = "${var.key_pair_name}"

  pre_tag         = "${var.pre_tag}"
  post_tag        = "${var.post_tag}"
  tag_service     = "${var.tag_service}"
  tag_environment = "${var.tag_service}"
  tag_version     = "${var.tag_version}"

  hosted_zone_id          = "${var.hosted_zone_id}"
  domain_name             = "${var.domain_name}"
  openvpn_dns_record_name = "${var.openvpn_dns_record_name}"

  openvpn_admin_user = "${var.openvpn_admin_user}"
  openvpn_admin_pw   = "${var.openvpn_admin_pw}"
}
