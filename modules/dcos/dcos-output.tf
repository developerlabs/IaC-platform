output "dcos_url" {
  value = "${module.dcos.dcos_dns_url}"
}

output "jenkins_url" {
  value = "${module.dcos.jenkins_url}"
}
