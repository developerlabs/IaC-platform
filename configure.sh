#!/usr/bin/env bash
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

modules=("docker-private-registry" "api-gateway" "elk" "marathon-snapshot" "ecr" "jenkins")
VERSION=master
echo -e "\nPlease specify the preferred version of the application (Leave empty for the master version).
You can find the latest release version here.${GREEN}https://github.com/microservices-today/IaC-wrapper/releases.${NC}"
read VERSION
if [[ -z "$VERSION" ]]; then
    VERSION=master
fi
cat ./modules/dcos/dcos.tf | sed "s/ref=master/ref="$VERSION/ > ./main.tf
cat ./modules/dcos/dcos.dummy > ./terraform.dummy
cat ./modules/dcos/dcos-variables.tf > ./variables.tf

for module in "${modules[@]}"
do
   echo -e "Do you want to run ${GREEN}$module${NC} ? yes/no"
   read ANS
   if [ ${ANS} == 'yes' ]
   then
   cat ./modules/$module/$module.tf | sed "s/ref=master/ref="$VERSION/ >> ./main.tf
   cat ./modules/$module/$module.dummy >> ./terraform.dummy
   cat ./modules/$module/$module-variables.tf >> ./variables.tf
   fi
done

terraform get -update
