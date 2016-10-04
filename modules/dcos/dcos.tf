module "dcos" {
  source = "github.com/microservices-today/IaC-dcos?ref=master"

  aws_region = "${var.aws_region}"
  vpc_id = "${var.vpc_id}"
  public_subnet_id = "${var.public_subnet_id}"
  public_route_table_id = "${var.public_route_table_id}"
  public_security_group_id = "${var.public_security_group_id}"

  key_pair_name = "${var.key_pair_name}"
  instance_type = "${var.instance_type}"
  dcos_master_disk_size = "${var.dcos_master_disk_size}"
  dcos_agent_disk_size = "${var.dcos_agent_disk_size}"
  master_user_data = "${var.master_user_data}"

  pre_tag = "${var.pre_tag}"
  post_tag = "${var.post_tag}"
  tag_service = "${var.tag_service}"
  tag_environment = "${var.tag_service}"
  tag_version = "${var.tag_version}"

  coreos_amis = "${var.coreos_amis}"
  centos_amis = "${var.centos_amis}"

  nfs_access_address = "${var.nfs_access_address}"
  aws_ssl_certificate_arn_id = "${var.aws_ssl_certificate_arn_id}"

  agent_asg_min_size = "${var.agent_asg_min_size}"
  agent_asg_desired_capacity = "${var.agent_asg_desired_capacity}"
  agent_asg_max_size = "${var.agent_asg_max_size}"
  agent_asg_health_check_grace_period = "${var.agent_asg_health_check_grace_period}"
  agent_asg_health_check_type = "${var.agent_asg_health_check_type}"

  public_agent_asg_min_size = "${var.public_agent_asg_min_size}"
  public_agent_asg_desired_capacity = "${var.public_agent_asg_desired_capacity}"
  public_agent_asg_max_size = "${var.public_agent_asg_max_size}"
  public_agent_asg_health_check_grace_period = "${var.public_agent_asg_health_check_grace_period}"
  public_agent_asg_health_check_type = "${var.public_agent_asg_health_check_type}"

  hosted_zone_id = "${var.hosted_zone_id}"
  domain_name = "${var.domain_name}"
  master_dns_record_name = "${var.master_dns_record_name}"
  tyk_dns_record_name = "${var.tyk_dns_record_name}"

  dcos_installer_url = "${var.dcos_installer_url}"
  dcos_cluster_name = "${var.dcos_cluster_name}"
  dcos_timezone = "${var.dcos_timezone}"
  dcos_username = "${var.dcos_username}"
  dcos_password = "${var.dcos_password}"
  dcos_master_count = "${var.dcos_master_count}"

  s3_bucket_name = "${var.s3_bucket_name}"
  filebeat_docker_image = "${var.filebeat_docker_image}"
  dcos_edition = "${var.dcos_edition}"
}
