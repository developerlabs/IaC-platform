module "jenkins" {
  source = "github.com/microservices-today/IaC-dcos-cicd//terraform?ref=master"

  jenkins_cpu = "${var.jenkins_cpu}"
  jenkins_memory = "${var.jenkins_memory}"
  host_volume = "${var.jenkins_host_volume}"

  jenkins_jobs_s3_path = "${var.jenkins_jobs_s3_path}"

  dcos_url = "${module.dcos.dcos_url}"
  dcos_acs_token = "${module.dcos.dcos_acs_token}"
}
