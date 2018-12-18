export RG="drill"
export LOCATION="westus2"

az group create \
    --name $RG \
    --location $LOCATION 

az vm create \
    --resource-group $RG \
    --name apache-drill \
    --location $LOCATION \
    --image Canonical:UbuntuServer:18.04-LTS:latest \
    --public-ip-address "apache-drill-ip" \
    --custom-data ./cloud-init.txt \
    --generate-ssh-keys 

NICID=`az vm show -g $RG -n apache-drill --query "networkProfile.networkInterfaces[0].id" -o tsv`

NSGID=`az network nic show --ids $NICID --query "networkSecurityGroup.id" -o tsv`

NSGNAME=`az network nsg show --ids $NSGID --query "name" -o tsv`

az network nsg rule delete \
    --resource-group $RG \
    --name default-allow-ssh \
    --nsg-name $NSGNAME 

az network nsg rule create \
    --resource-group $RG \
    --name apache-drill \
    --nsg-name $NSGNAME \
    --destination-port-ranges 8047 \
    --priority 300

IPID=`az network nic show --ids $NICID --query "ipConfigurations[0].publicIpAddress.id" -o tsv`

IP=`az network public-ip show --ids $IPID --query "ipAddress" -o tsv`

echo "Apache Drill is available at http://$IP:8047"
