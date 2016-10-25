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

  dcos_url = "${module.dcos.dcos_url}"
  dcos_acs_token = "${module.dcos.dcos_acs_token}"

  tyk_api_key = "${var.tyk_api_key}"
  tyk_rpc_credentials = "${var.tyk_rpc_credentials}"
  tyk_secret = "${var.tyk_secret}"
}
