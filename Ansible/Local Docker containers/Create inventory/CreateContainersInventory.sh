#! /bin/bash

containers_ids=$(docker ps -q) # get active containers ids
if [ "$containers_ids" == "" ]; then # check if there are 
    echo "0 active containers"       # any active containers
    exit 1
fi
containers_ips=$(docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $containers_ids)
#^ use formatted docker inspect command to list only ips of running containers

# create inventory.yaml:
tee inventory.yaml << EOF 
containers:
  hosts:
EOF

# populate inventory.yaml file
counter=1
for id in $containers_ips
do
    tee -a inventory.yaml << EOF 
    container$counter:
      ansible_host: $id
EOF
let "counter++"
done

