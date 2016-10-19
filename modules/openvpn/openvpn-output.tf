output "OpenVPN_Admin_Password" {
  value = "${var.openvpn_admin_pw}"
}

output "OpenVPN_Admin_UserName" {
  value = "${var.openvpn_admin_user}"
}

output "OpenVPN Admin URL" {
  value = "https://${var.openvpn_dns_record_name}.${var.domain_name}/admin"
}

output "OpenVPN URL to download client config" {
  value = "https://${var.openvpn_dns_record_name}.${var.domain_name}"
}
