variable "openvpn_admin_user" {
  description = "OpenVPN Admin username"
}
variable "openvpn_admin_pw" {
  description = "OpenVPN Admin password"
}
variable "openvpn_dns_record_name" {
  description = "Name of the record that you want to create for load balancer"
}

variable "management_subnet_id" {
  description = "Management subnet ID"
}
