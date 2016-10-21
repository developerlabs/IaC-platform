/**
 * IaC: API Gateway
 */
variable "tyk_api_key" {
  description = "Tyk Dashboard API Access Credentials in the Users section of Dashboard"
}

variable "tyk_rpc_credentials" {
  description = "RPC Credentials in the Users section of Dashboard"
}

variable "tyk_secret" {
  description = "Tyk secret that we define so to interact with our Tyk node programatically"
}

variable "redis_snapshot_name" {
  description = "Redis snapshot taken in AWS"
  default = ""
}
