### IaC: Next Generation Platform

![Architecture of Next Generation Platform](/doc/architecture.png)

Script to setup a DC/OS cluster and other applications
 - [DC/OS cluster](https://github.com/microservices-today/IaC-dcos)
 - [Docker private registry](https://github.com/microservices-today/IaC-dcos-docker-registry)
 - [API gateway](https://github.com/microservices-today/IaC-api-gateway)
 - [ELK](https://github.com/microservices-today/IaC-elk)
 - [Marathon Snapshot](https://github.com/microservices-today/IaC-marathon-snapshots)
 - [EC2 Container Registry](https://github.com/microservices-today/IaC-ecr)
 - [OpenVPN Server](https://github.com/microservices-today/IaC-openvpn)
 - [Jenkins](https://github.com/microservices-today/IaC-dcos-cicd)
 - [Docker Cleanup](https://github.com/microservices-today/IaC-docker-cleanup)
 - [Elasticache](https://github.com/microservices-today/IaC-elasticache/)

#### Pre-requisites
##### With IaC-Manager
- Use [IaC-manager](https://github.com/microservices-today/IaC-manager) to create a manager node. 
Then SSH into the manager node and perform the steps for installation.
- "Accept Software Terms" of aws marketplace for 
[CentOS](https://aws.amazon.com/marketplace/search/results?searchTerms=centos&page=1&ref_=nav_search_box) or 
[CoreOS](https://aws.amazon.com/marketplace/search/results?searchTerms=coreos&page=1&ref_=nav_search_box).

##### Manual
- An IAM account with administrator privileges.
- [Terraform 0.7.7](https://www.terraform.io/intro/getting-started/install.html)
- AWS CLI

#### Steps for installation
- Clone this repo .
- Export AWS credentials as bash variables (e.g. `ap-northeast-1` for Tokyo and `ap-southeast-1` for Singapore region):
```
export AWS_ACCESS_KEY_ID="anaccesskey" 
export AWS_SECRET_ACCESS_KEY="asecretkey"
export AWS_DEFAULT_REGION="ap-northeast-1"
```  
If you are using IaC-manager, ignore `AWS_ACCESS_KEY_ID` & `AWS_SECRET_ACCESS_KEY`. 
- `cd IaC-wrapper`
- Run `./configure.sh` to decide which modules to deploy. 
- Modify params in `terraform.tfvars`.              
See [Jenkins restoration](https://github.com/microservices-today/IaC-platform#jenkins-restoration) for setting `jenkins_restore_s3_path` parameter. 
- Modify params in `variables.tf` to change subnet or add AMI accordingly to your aws region
- Run `terraform plan` to see the plan to execute.
- Run `terraform apply` to run the scripts.
- You may have `prod/dev/stage` configurations in
`terraform.tfvars.{prod/dev/stage}` files (already ignored by `.gitignore`).

##### Steps to import a new module
- Create a folder with module-name in `modules` directory and add the following files within that folder.
  - `module-name.tf`             : File to create and manage module.
  - `module-name.dummy`          : Dummy values for the module.
  - `module-name-variables.tf`   : Variables required for the module.
  - `module-name-output.tf`      : Outputs to be displayed after execution.

- Add `module-name` to module array in `configure.sh`.

#### Monitoring
- [Sysdig](http://www.sysdig.org/) containers will be running in all dcos nodes for proper monitoring of instances 
through sysdig cloud.
- [Filebeat-Docker][filebeat-docker] containers will be running in all dcos nodes for dcos and marathon log capturing. 
By installing [Iac-Elk][iac-elk] you will be able to monitor the logs through aws elasticsearch service.

#### Parameters

##### Inputs

| Name | Description | Default | Required |
|------|-------------|:-----:|:-----:|
| aws_access_key | AWS access key | - | yes |
| aws_secret_key | AWS secret key | - | yes |
| vpc_id | VPC ID | - | yes |
| vpc_cidr | VPC CIDR block | - | yes |
| private_subnet_id | Private subnet ID | - | yes |
| public_subnet_id | Public subnet ID (using in external ELB creation) | - | yes |
| public_security_group_id | Public security group ID (For adding inbound rules required for external Tyk ELB) | - | yes |
| private_subnet_az | Private subnet availability zone | - | yes |
| public_agent_ids | IDs of instances to attach with external load balancer in comma-separated format | - | yes |
| pre_tag | Pre-phrase for tags | `"pre"` | no |
| post_tag | Post-phrase for tags | `"post"` | no |
| redis_engine_version | Version of Redis engine | `"2.8.24"` | no |
| redis_node_type | Redis node type | `"cache.m3.large"` | no |
| redis_port | Redis port | `"6379"` | no |
| redis_parameter_group_name | Redis parameter group name | `"default.redis2.8"` | no |
| dcos_url | Url of DC/OS master or ELB load balancer in case of multiple master nodes | - | yes |
| dcos_token | DCOS access token | - | yes |
| tyk_config | Tyk marathon configuration files | `"tyk.template"` | no |
| tyk_api_key | Tyk Dashboard API Access Credentials in the Users section of Dashboard | - | yes |
| tyk_rpc_credentials | RPC Credentials in the Users section of Dashboard | - | yes |
| tyk_listen_port | Tyk listen port | `"8181"` | no |
| tyk_secret | Tyk secret that we define so to interact with our Tyk node programatically | - | yes |
| autoscale_config | Marathon-lb Autoscale marathon configuration files | `"marathon-lb-autoscale.template"` | no |
| autoscale_haproxy | Url for haproxy (Marathon-lb) | `"http://marathon-lb.marathon.mesos:9090"` | no |
| autoscale_rps | Target number of requests per second per app instance  | `100` | no |
| autoscale_samples | Number of samples to average | `2` | no |
| autoscale_threshold_instances | Scaling will occur when the target number of instances differs from the actual number by at least this amount | `1` | no |

##### Outputs

| Name | Description |
|------|-------------|
| OpenVPN Connect URL |  |
| OpenVPN Admin URL | |
| OpenVPN Credentials | |
| DC/OS URL | |
| Jenkins URL | |
| redis hostname |  |

#### Tagging Conventions
Tags provides specific identification of AWS resources. Following tags are mentioned in terraform.dummy.
* pre_tag - This is used as a pre-text for 'Name' tags to identify AWS resources, DNS names & S3 bucket.
* post_tag - This is used as a post-text for 'Name' tags to identify AWS resources, DNS names & S3 bucket. 

Following restrictions applies:
* pre_tag can be between 3 and 12 characters in length.
* post_tag can be between 3 and 6 characters in length.
* Tag name can contain only alphabets, numbers and dashes.
* Tag name cannot begin or end with a dash.
* Do not use `aws` as prefix.

#### Jenkins restoration
* Take backup of Jenkins home folder, excluding below files, to S3 bucket, as a tar gzip file (Eg: jenkins.tar.gz).
```
config-history/*
jobs/*/workspace*
jobs/*/builds/*/archive
plugins/*/*
plugins/*.bak
war
cache
```

`sudo tar -cvzf jenkins.tar.gz jenkins/`  
`aws s3 cp jenkins.tar.gz s3://bucket_name/folder_name`
* Specify the S3 bucket path to Jenkins backup file (Eg: `bucket_name/folder_name/jenkins.tar.gz`) as `jenkins_restore_s3_path` parameter value in `terraform.tfvars`.

#### Notes
- SSH into the manager node and check whether `terraform.out` in `home/centos` contains:    
a record of the VPC, Subnet, Security Group and Nat gateway ID.
- More details on [terraform-docs](https://github.com/segmentio/terraform-docs).
- If unable to perform `terraform destroy`, instance profile can be removed using aws cli only.
  `aws iam list-instance-profiles | grep InstanceProfileName`
  `aws iam delete-instance-profile --instance-profile-name ${var.pre_tag}_s3_profile_master_${var.post_tag}`
  `aws iam delete-instance-profile --instance-profile-name ${var.pre_tag}_s3_profile_agents_${var.post_tag}`
  `aws iam delete-instance-profile --instance-profile-name ${var.pre_tag}_s3_profile_public_agent_${var.post_tag}`

[filebeat-docker]: <https://github.com/microservices-today/filebeat-docker>
[iac-elk]: <https://github.com/microservices-today/IaC-elk>

#### Contributing

1. Make a feature branch: __git checkout -b your-username/your-feature__
2. Follow Terraform Style Guide
3. Make your feature. Keep things tidy so you have one commit per self-contained change (squashing can help).
4. Push your branch: __git push -u origin your-username/your-feature__
5. Open GitHub to the repo,
   under "Your recently pushed branches", click __Pull Request__ for
   _your-username/your-feature_.

Be sure to use a separate feature branch and pull request for every
self-contained feature.  If you need to make changes from feedback, make
the changes in place rather than layering on commits (use interactive
rebase to edit your earlier commits).  Then use __git push --force
origin your-feature__ to update your pull request.
