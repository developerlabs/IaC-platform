module "docker-cleanup" {
  source = "github.com/microservices-today/IaC-docker-cleanup?ref=master"

  agent_count = "${module.dcos.agent_count}"
  dcos_url    = "${module.dcos.dcos_url}"
}
