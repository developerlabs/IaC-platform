module "ecr" {
  source = "github.com/microservices-today/IaC-ecr.git?ref=v1.0.0"
  aws_region = "${var.aws_region}"
  dcos_url = "${module.dcos.dcos_url}"
  dcos_acs_token = "${module.dcos.dcos_acs_token}"
  pre_tag = "${var.pre_tag}"
  post_tag = "${var.post_tag}"
}
