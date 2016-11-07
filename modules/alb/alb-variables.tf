/**
 * IaC: ALB
 */
variable "alb_domain" {
  description = "Subdomain name for ALB"
}

variable "alb_health_path" {
  description = "Service path to do the health check."
}

variable "alb_health_port" {
  description = "Service port to do the health check."
}
variable "alb_name" {
  description = "Application Load Balancer Name"
}

variable "alb_service_port" {
  description = "Application service port"
}
