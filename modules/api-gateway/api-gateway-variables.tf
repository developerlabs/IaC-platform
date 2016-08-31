/**
 * IaC: API Gateway
 */
variable "redis_engine_version" {
  description = "Version of Redis engine"
  default = "2.8.24"
}
variable "redis_node_type" {
  description = "Redis node type"
  default = "cache.m3.large"
}
variable "redis_port" {
  description = "Redis port"
  default = "6379"
}
variable "redis_parameter_group_name" {
  description = "Redis parameter group name"
  default = "default.redis2.8"
}
variable redis_cluster_name {
  description = "Name must contain only letters, digits, or hyphens and be 20 characters or less in length."
}

variable "tyk_config" {
  description = "Tyk marathon configuration files"
  default = "templates/tyk.tpl"
}
variable "tyk_api_key" {
  description = "Tyk Dashboard API Access Credentials in the Users section of Dashboard"
}
variable "tyk_rpc_credentials" {
  description = "RPC Credentials in the Users section of Dashboard"
}
variable "tyk_listen_port" {
  description = "Tyk listen port"
  default = "8181"
}
variable "tyk_secret" {
  description = "Tyk secret that we define so to interact with our Tyk node programatically"
}

variable "marathon_lb_config" {
  description = "Marathon-lb Autoscale marathon configuration files"
  default = "templates/marathon_lb.tpl"
}

variable "autoscale_config" {
  description = "Marathon-lb Autoscale marathon configuration files"
  default = "templates/marathon-lb-autoscale.tpl"
}
variable "autoscale_haproxy" {
  description = "Url for haproxy (Marathon-lb)"
  default = "http://marathon-lb.marathon.mesos:9090"
}
variable "autoscale_rps" {
  description = "Target number of requests per second per app instance "
  default = 100
}
variable "autoscale_samples" {
  description = "Number of samples to average"
  default = 2
}
variable "autoscale_threshold_instances" {
  description = "Scaling will occur when the target number of instances differs from the actual number by at least this amount"
  default = 1
}
