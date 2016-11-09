output "OpenVPN_Admin_Password" {
  value = "${var.openvpn_admin_pw}"
}

output "OpenVPN_Admin_UserName" {
  value = "${var.openvpn_admin_user}"
}

output "OpenVPN_Admin_URL" {
  value = "${module.openvpn.OpenVPN_Admin_URL}"
}

output "OpenVPN_Connect_URL" {
  value = "${module.openvpn.OpenVPN_Connect_URL}"
}

output "OpenVPN Server IP" {
  value = "${module.openvpn.OpenVPN_Server_IP}"
}
