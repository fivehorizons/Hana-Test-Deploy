#!/bin/bash

echo "Reading config...." >&2
if [ "${1}" != "" ]; then
    source ${1}
else
    source ./azuredeploy.cfg
fi


echo "deleting nfs servers"
az vm delete --yes --resource-group $rgname --name $NFSVMNAME1
az vm delete --yes --resource-group $rgname --name $NFSVMNAME2
az disk delete --yes --resource-group $rgname --name $NFSVMNAME1-data
az network nic delete --resource-group $rgname --name $NFSVMNAME1-static
az disk delete --yes --resource-group $rgname --name $NFSVMNAME2-data
az network nic delete --resource-group $rgname --name $NFSVMNAME2-static
az network lb delete --resource-group $rgname  --name nfsnfslb

echo "nfs servers deleted"