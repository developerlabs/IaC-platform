/**
 * IaC : elk
 */
variable "elasticsearch_domain_name" {
  description = "AWS elasticsearch domain name"
}

variable "logstash_instance_type" {
  description = "Logstash instance type"
  default = "t2.micro"
}
variable "logstash_server_disk_size" {
  description = "The size of logstash node root block device disk in GB"
  default = "8"
}
variable "logstash_docker_image" {
  description = "Logstash docker image form public docker registry"
  default= "microservicestoday/elk-aws-elastic"
}
variable "elastic_instance_type" {
  description = "Elasticsearch instance type"
  default = "m3.large.elasticsearch"
}
variable "elastic_instance_count" {
  description = "Number of instances in the cluster"
  default = "1"
}
variable "automated_snapshot_start_hour" {
  description = "Hour during which the elasticsearch service takes an automated daily snapshot of the indices in the domain."
  default = 23
}
