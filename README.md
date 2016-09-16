### IaC: Wrapper
Script to setup a DC/OS cluster and other applications
 - [DC/OS cluster](https://github.com/microservices-today/IaC-dcos)
 - [Docker private registry](https://github.com/microservices-today/IaC-dcos-docker-registry)
 - [API gateway](https://github.com/microservices-today/IaC-api-gateway)
 - [ELK](https://github.com/microservices-today/IaC-elk)
 - [Marathon Snapshot](https://github.com/microservices-today/IaC-marathon-snapshots)
 - [EC2 Container Registry](https://github.com/microservices-today/IaC-ecr)
 

#### Pre-requisites
##### With IaC-Manager
- Use [IaC-manager](https://github.com/microservices-today/IaC-manager) to create a manager node. Then SSH into the manager node and perform the steps for installation.  

##### Manual
- An IAM account with administrator privileges.
- Install [terraform](https://www.terraform.io/intro/getting-started/install.html) in your machine.
- Install AWS CLI.

#### Steps for installation
- Clone this repo .
- Export AWS credentials as bash variables (e.g. `ap-northeast-1` for Tokyo and `ap-southeast-1` for Singapore region):
```
export AWS_ACCESS_KEY_ID="anaccesskey" 
export AWS_SECRET_ACCESS_KEY="asecretkey"
export AWS_DEFAULT_REGION="ap-northeast-1"
```  
Need not export the `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` in case you are using the IaC-manager. 
- Run `./configure.sh` to decide which modules to deploy. 
- Import variables if using IaC-Manager  
`cp $HOME/terraform.out >> terraform.tfvars`. 
- `cat terraform.dummy >> terraform.tfvars`
- Modify params in `terraform.tfvars` for the required packages
- Modify the tag or branch in source property of each module in `main.tf` file.   
`source = "github.com/microservices-today/IaC-dcos?ref=v1.0.2"` 
`source = "github.com/microservices-today/IaC-dcos?ref=master"` 
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

- Add `module-name` to module array in `configure.sh`.

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
| cache_security_group_id |  |
| hostname |  |
| port |  |
| endpoint |  |

#### Notes
- SSH into the manager node and check whether `terraform.out` in `home/centos` contains:    
a record of the VPC, Subnet, Security Group and Nat gateway ID.
- More details on [terraform-docs](https://github.com/segmentio/terraform-docs).
