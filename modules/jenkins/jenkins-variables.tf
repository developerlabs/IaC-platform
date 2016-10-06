variable "jenkins_cpu" {
  description = "CPU shares to allocate to each Jenkins master"
  default = "1"
}
variable "jenkins_memory" {
  description = "CPU shares to allocate to each Jenkins master"
  default = "1024"
}
variable "jenkins_host_volume" {
  description = "The location of a volume on the host to be used for persisting Jenkins configuration and build data"
  default = "/var/jenkins_nfs"
}
variable "jenkins_jobs_s3_path" {
  description = "S3 path of the folder containing jenkins jobs (Eg: bucket_name/folder_name/sub_folder_containing_jenkins_jobs)"
}
variable "restore_jenkins" {
  description = "Enable/Disable jenkins backup (0 - Disable, 1 - Enable)"
}
variable "jenkins_backup_s3_path" {
  description = "S3 path of the folder containing entire jenkins home folder(Eg: bucket_name/folder_name/jenkins.tar.gz). Ignored if 'restore jenkins' is disabled."
}
