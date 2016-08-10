module "dcos" {
  source = "github.com/microservices-today/IaC-dcos?ref=master"

  aws_region = "${var.aws_region}"
  vpc_id = "${var.vpc_id}"
  private_subnet_cidr = "${var.private_subnet_cidr}"
  public_subnet_id = "${var.public_subnet_id}"
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
  dcos_username = "${var.dcos_username}"
  dcos_password = "${var.dcos_password}"
  dcos_master_count = "${var.dcos_master_count}"

  s3_bucket_name = "${var.s3_bucket_name}"
}


module "api-gateway" {
  source = "github.com/microservices-today/IaC-api-gateway?ref=master"

  vpc_id = "${var.vpc_id}"
  vpc_cidr = "${var.vpc_cidr}"

  private_subnet_id = "${module.dcos.private_subnet_id}"
  private_subnet_az = "${module.dcos.private_subnet_availability_zone}"

  public_agent_ids = "${module.dcos.public_agent_ids}"

  pre_tag = "${var.pre_tag}"
  post_tag  = "${var.post_tag}"
  tag_service = "${var.tag_service}"
  tag_environment = "${var.tag_service}"
  tag_version = "${var.tag_version}"

  redis_engine_version = "${var.redis_engine_version}"
  redis_node_type = "${var.redis_node_type}"
  redis_port = "${var.redis_port}"
  redis_parameter_group_name = "${var.redis_parameter_group_name}"

  dcos_url = "${module.dcos.dcos_url}"
  dcos_acs_token = "${module.dcos.dcos_acs_token}"

  marathon_lb = "${var.marathon_lb_config}"

  autoscale_config = "${var.autoscale_config}"
  autoscale_haproxy = "${var.autoscale_haproxy}"
  autoscale_rps = "${var.autoscale_rps}"
  autoscale_samples = "${var.autoscale_samples}"
  autoscale_threshold_instances = "${var.autoscale_threshold_instances}"

  tyk_config = "${var.tyk_config}"
  tyk_api_key = "${var.tyk_api_key}"
  tyk_rpc_credentials = "${var.tyk_rpc_credentials}"
  tyk_listen_port = "${var.tyk_listen_port}"
  tyk_secret = "${var.tyk_secret}"
}


module "docker-registry" {
  source = "github.com/microservices-today/IaC-dcos-docker-registry?ref=master"

  bootstrap_ip = "${module.dcos.bootstrap_ip}"
  agent_ips = "${module.dcos.agent_ips}"
  agent_count = "${module.dcos.agent_count}"
  aws_region = "${var.aws_region}"
  s3_bucket_name = "${var.s3_bucket_name}"

  pre_tag = "${var.pre_tag}"
  post_tag = "${var.post_tag}"
  tag_service = "${var.tag_service}"
  tag_environment = "${var.tag_service}"
  tag_version = "${var.tag_version}"

  dcos_url = "${module.dcos.dcos_url}"
  dcos_acs_token = "${module.dcos.dcos_acs_token}"
}
