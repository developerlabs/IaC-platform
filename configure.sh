#!/usr/bin/env bash

#!/usr/bin/env bash

modules=( "docker-private-registry" "api-gateway" "elk" "marathon-snapshot" "ecr")

cat ./modules/dcos/dcos.tf > ./main.tf
cat ./modules/dcos/dcos.dummy > ./terraform.dummy
cat ./modules/dcos/dcos-variables.tf > ./variables.tf

for module in "${modules[@]}"
do
   echo "Do you want to run $module ? yes/no"
   read ANS
   if [ ${ANS} == 'yes' ]
   then
   cat ./modules/$module/$module.tf >> ./main.tf
   cat ./modules/$module/$module.dummy >> ./terraform.dummy
   cat ./modules/$module/$module-variables.tf >> ./variables.tf
   fi
done

terraform get -update
