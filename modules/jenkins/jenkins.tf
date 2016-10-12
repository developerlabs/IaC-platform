module "jenkins" {
  source = "github.com/microservices-today/IaC-dcos-cicd//terraform?ref=master"

  jenkins_jobs_restore_s3_path = "${var.jenkins_jobs_restore_s3_path}"

  restore_jenkins = "${var.restore_jenkins}"
  jenkins_restore_s3_path = "${var.jenkins_restore_s3_path}"

  dcos_url = "${module.dcos.dcos_url}"
  dcos_acs_token = "${module.dcos.dcos_acs_token}"
  agent_ips = "${module.dcos.agent_ips}"
}
