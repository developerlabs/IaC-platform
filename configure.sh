#!/usr/bin/env bash
GREEN='\033[0;32m'
NC='\033[0m' # No Color

modules=("docker-private-registry" "api-gateway" "elk" "marathon-snapshot" "ecr")

cat ./modules/dcos/dcos.tf > ./main.tf
cat ./modules/dcos/dcos.dummy > ./terraform.dummy
cat ./modules/dcos/dcos-variables.tf > ./variables.tf

for module in "${modules[@]}"
do
   echo -e "Do you want to run ${GREEN}$module${NC} ? yes/no"
   read ANS
   if [ ${ANS} == 'yes' ]
   then
   cat ./modules/$module/$module.tf >> ./main.tf
   cat ./modules/$module/$module.dummy >> ./terraform.dummy
   cat ./modules/$module/$module-variables.tf >> ./variables.tf
   fi
done

terraform get -update
