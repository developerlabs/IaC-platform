variable "openvpn_amis" {
  description = "CentOS AMIs by region"
  default = {
    ap-southeast-1 = "ami-dfbe61bc"
    ap-northeast-1 = "ami-7fc2391e"
    ap-south-1 = "ami-50ddb73f"
    us-east-1 = "ami-6d1c2007"
    us-west-1 = "ami-af4333cf"
    us-west-2 = "ami-d2c924b2"
  }
}
variable "openvpn_admin_user" {
  default = "openvpn"
}

variable "openvpn_admin_pw" {
  default = "openvpn"
}
variable "openvpn_dns_record_name" {
  description = "Name of the record that you want to create for load balancer"
}
