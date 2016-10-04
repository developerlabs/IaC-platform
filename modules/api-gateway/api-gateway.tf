module "api-gateway" {
  source = "github.com/microservices-today/IaC-api-gateway?ref=master"

  vpc_id = "${var.vpc_id}"
  vpc_cidr = "${var.vpc_cidr}"

  private_subnet_id = "${module.dcos.private_primary_subnet_id}"
  private_subnet_az = "${module.dcos.private_subnet_availability_zone}"

  public_agent_ids = "${module.dcos.public_agent_ids}"

  pre_tag = "${var.pre_tag}"
  post_tag  = "${var.post_tag}"
  tag_service = "${var.tag_service}"
  tag_environment = "${var.tag_service}"
  tag_version = "${var.tag_version}"

  redis_engine_version = "${var.redis_engine_version}"
  redis_cluster_name = "${var.redis_cluster_name}"
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
