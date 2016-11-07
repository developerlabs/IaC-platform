#!/usr/bin/env bash
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

modules=("docker-private-registry" "api-gateway" "elk" "marathon-snapshot" "docker-cleanup" "ecr" "jenkins" "openvpn" "elasticache" "alb")
VERSION=master
echo -e "\nPlease specify the preferred version of the application (Leave empty for the master version).
You can find the latest release version here.${GREEN}https://github.com/microservices-today/IaC-wrapper/releases.${NC}"
read VERSION
if [[ -z "$VERSION" ]]; then
    VERSION=master
    else
   git checkout tags/$VERSION
fi
touch main.tf terraform.tfvars variables.tf outputs.tf
cp terraform.tfvars terraform.tfvars.bkp

cat ./modules/dcos/dcos.tf | sed "s/ref=master/ref="$VERSION/ > ./main.tf
cat ./modules/dcos/dcos.dummy > ./terraform.tfvars && echo -e '\n\n' >> ./terraform.tfvars
cat ./modules/dcos/dcos-variables.tf > ./variables.tf
cat ./modules/dcos/dcos-output.tf > ./outputs.tf

for module in "${modules[@]}"
do
   echo -e "Do you want to run ${GREEN}$module${NC} ? y/n"
   read ANS
   if [ ${ANS} == 'y' ]
   then
   cat ./modules/$module/$module.tf | sed "s/ref=master/ref="$VERSION/ >> ./main.tf
   cat ./modules/$module/$module.dummy >> ./terraform.tfvars && [ ! -s ./modules/$module/$module.dummy ] || echo -e '\n\n' >> ./terraform.tfvars
   cat ./modules/$module/$module-variables.tf >> ./variables.tf
   cat ./modules/$module/$module-output.tf >> ./outputs.tf
   fi
done

terraform get -update
cat $HOME/terraform.out >> terraform.tfvars

# Format terraform files
terraform fmt -list=false

# Remove blank lines from EOF
sed -i -e :a -e '/^\n*$/{$d;N;};/\n$/ba' ./terraform.tfvars
