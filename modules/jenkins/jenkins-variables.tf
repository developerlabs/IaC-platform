variable "jenkins_jobs_restore_s3_path" {
  description = "S3 path of the folder containing jenkins jobs (Eg: bucket_name/folder_name/sub_folder_containing_jenkins_jobs)"
}
variable "restore_jenkins" {
  description = "Enable/Disable jenkins backup (0 - Disable, 1 - Enable)"
}
variable "jenkins_restore_s3_path" {
  description = "S3 path of the folder containing entire jenkins home folder(Eg: bucket_name/folder_name/jenkins.tar.gz). Ignored if 'restore jenkins' variable has value 0."
}
