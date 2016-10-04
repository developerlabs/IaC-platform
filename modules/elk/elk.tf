module "elk" {
  source = "github.com/microservices-today/IaC-elk.git?ref=master"

  key_pair_name = "${var.key_pair_name}"
  private_security_group_id = "${module.dcos.private_security_group_id}"
  private_subnet_id = "${module.dcos.private_primary_subnet_id}"
  pre_tag = "${var.pre_tag}"
  post_tag = "${var.post_tag}"
  nat_gateway_public_ip = "${module.dcos.nat_gateway_public_ip}"
  elb_logstash_id = "${module.dcos.elb_logstash_id}"
  aws_region = "${var.aws_region}"
  tag_service = "${var.tag_service}"
  tag_environment = "${var.tag_service}"
  tag_version = "${var.tag_version}"
  elasticsearch_domain_name = "${var.elasticsearch_domain_name}"
  elastic_instance_type = "${var.elastic_instance_type}"
  elastic_instance_count = "${var.elastic_instance_count}"
  automated_snapshot_start_hour = "${var.automated_snapshot_start_hour}"
}
