variable "aws_region" {
  description = "EC2 Region for the VPC"
}

variable "vpc_id" {
  description = "VPC ID"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
}

variable "pre_tag" {
  description = "Pre-tag to be attached to AWS resources for identification"
}

variable "post_tag" {
  description = "Post-tag to be attached to AWS resources for identification"
}

variable "tag_service" {
  description = "Specify the service"
}

variable "tag_environment" {
  description = "Specify the environment"
}

variable "tag_version" {
  description = "Specify the version"
}

variable "aws_ssl_certificate_arn_id" {
  description = "ARN of SSL certificate created by AWS Certificate Manager"
}

variable "key_pair_name" {
  description = "Name of AWS key pair to use with instances"
}

variable "internet_gateway_id" {
  description = "Internet Gateway ID"
}

variable "dcos_master_count" {
  description = "Master count"
}

variable "agent_asg_desired_capacity" {
  description = "The number of Amazon EC2 instances (agents) that should be running in the group."
}

variable "public_agent_asg_desired_capacity" {
  description = "The number of Amazon EC2 instances ( public agents) that should be running in the group."
}

/**
 * DC/OS
 */
variable "dcos_cluster_name" {
  description = "DC/OS cluster name"
}

variable "dcos_timezone" {
  description = "DC/OS timezone"
  default     = "Asia/Tokyo"
}

variable "master_user_data" {
  description = "Master Cloud config files"

  default = {
    "0" = "%s/files/user-data/nfs-master-cloud-config.yaml.tpl"
    "1" = "%s/files/user-data/master-cloud-config.yaml.tpl"
  }
}

/**
 * Route 53
 */
variable hosted_zone_id {
  description = "ID for the domain hosted zone"
}

variable domain_name {
  description = "Name of the domain where record(s) need to create"
}

variable master_dns_record_name {
  description = "Name of the record that you want to create for load balancer"
}

variable tyk_dns_record_name {
  description = "Name of the record that you want to create for load balancer"
}

variable "jenkins_dns_record_name" {
  description = "Name of the record that you want to create for load balancer"
}

variable "filebeat_docker_image" {
  description = "Filebeat docker image form public docker registry"
  default     = "microservicestoday/filebeat"
}

variable "dcos_edition" {
  description = "DCOS edition type, enterprise/community"
  default     = "community"
}

variable "dcos_installer_url" {
  description = "DCOS installer url"
  default = {
    "enterprise" = ""
    "community"  = "https://downloads.dcos.io/dcos/stable/dcos_generate_config.sh"
  }
}

variable "sysdig_access_key" {
  description = "Sysdig access key"
}
