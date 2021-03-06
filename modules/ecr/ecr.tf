module "ecr" {
  source     = "github.com/microservices-today/IaC-ecr.git?ref=master"
  aws_region = "${var.aws_region}"
  dcos_url   = "${module.dcos.dcos_url}"
  pre_tag    = "${var.pre_tag}"
  post_tag   = "${var.post_tag}"
}
