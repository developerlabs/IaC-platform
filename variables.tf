variable "aws_region" {
  description = "EC2 Region for the VPC"
}
variable "coreos_amis" {
  description = "CoreOS AMIs by region"
  default = {
    ap-northeast-1 = "ami-56498b37"
    ap-southeast-1 = "ami-b9ed34da"
  }
}
variable "centos_amis" {
  description = "CentOS AMIs by region"
  default = {
    ap-southeast-1 = "ami-f068a193"
    ap-northeast-1 = "ami-eec1c380"
  }
}
variable "vpc_id" {
  description = "VPC ID"
}
variable "vpc_cidr" {
  description = "VPC CIDR block"
}
variable "public_subnet_id" {
  description = "Public subnet ID"
}
variable "public_security_group_id" {
  description = "Public security group ID"
}
variable "pre_tag" {
  description = "Pre-phrase for tags"
  default = "Microservice"
}
variable "post_tag" {
  description = "Post-phrase for tags"
  default = "Staging"
}
variable "tag_service" {
  description = "Service tag"
}
variable "tag_environment" {
  description = "Environment tag"
}
variable "tag_version" {
  description = "Version tag"
}
variable "aws_ssl_certificate_arn_id" {
  description = "ARN ID of the ssl certificate created in AWS"
  default = ""
}
variable "key_pair_name" {
  description = "Name of AWS key pair to use with instances"
}
variable "s3_bucket_name" {
  description = "Name of S3 Bucket"
}


/**
 * DC/OS
 */
variable "dcos_cluster_name" {
  description = "DC/OS cluster name"
}
variable "dcos_username" {
  description = "DC/OS Username"
}
variable "dcos_password" {
  description = "DC/OS password"
}
variable "dcos_master_count" {
  description = "Master count"
  default = "3"
}
variable "dcos_installer_url" {
  description = "DCOS installer url"
  default = "https://downloads.mesosphere.com/dcos/stable/dcos_generate_config.ee.sh"
}
variable "master_user_data" {
  description = "Master Cloud config files"
  default = {
    "0" = "%s/files/user-data/nfs-master-cloud-config.yaml.tpl"
    "1" = "%s/files/user-data/master-cloud-config.yaml.tpl"
  }
}

variable "dcos_master_disk_size" {
  description = "The size of Master node root block device disk in GB"
  default = "30"
}
variable "dcos_agent_disk_size" {
  description = "The size of Agent node root block device disk in GB"
  default = "30"
}
variable "instance_type" {
  description = "DCOS instance type"
  default = {
    "bootstrap" = "m3.xlarge"
    "master" = "m3.xlarge"
    "public-agent" = "m3.xlarge"
    "agent" = "m3.xlarge"
  }
}
variable "private_subnet_cidr" {
  description = "CIDR for the Private Subnet"
  default = "10.0.1.0/24"
}
variable "nfs_access_address" {
  description = "NFS server access address"
  default = "10.0.1.0/16"
}

variable "agent_asg_max_size" {
  description = "The maximum size of the auto scale group (Max agent count)."
  default = "5"
}
variable "agent_asg_min_size" {
  description ="The minimum size of the auto scale group (Min agent count)."
  default = "1"
}
variable "agent_asg_desired_capacity" {
  description = "The number of Amazon EC2 instances (agents) that should be running in the group."
  default = "3"
}
variable "agent_asg_health_check_grace_period" {
  description = "After instance comes into service before checking health."
  default = "300"
}
variable "agent_asg_health_check_type" {
  description = "EC2 or ELB. Controls how health checking is done."
  default = "EC2"
}

variable "public_agent_asg_max_size" {
  description = "The maximum size of the auto scale group (Max public agent count)."
  default = "5"
}
variable "public_agent_asg_min_size" {
  description ="The minimum size of the auto scale group (Min public agent count)."
  default = "1"
}
variable "public_agent_asg_desired_capacity" {
  description = "The number of Amazon EC2 instances ( public agents) that should be running in the group."
  default = "3"
}
variable "public_agent_asg_health_check_grace_period" {
  description = "After instance comes into service before checking health."
  default = "300"
}
variable "public_agent_asg_health_check_type" {
  description = "EC2 or ELB. Controls how health checking is done."
  default = "EC2"
}

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
