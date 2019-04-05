#!/usr/bin/env bash

ACI_PERS_RESOURCE_GROUP=conda.dnvgl.com
ACI_PERS_STORAGE_ACCOUNT_NAME=condarepo
ACI_PERS_SHARE_NAME=condarepo

CONTAINER_IMAGE=marhoy/conda_dnvgl_com
CONTAINER_NAME=condadocker
DNS_NAME=condadocker

# Get storage key from the storage account
STORAGE_KEY=$(az storage account keys list --resource-group $ACI_PERS_RESOURCE_GROUP --account-name $ACI_PERS_STORAGE_ACCOUNT_NAME --query "[0].value" --output tsv)

az container create \
    --resource-group $ACI_PERS_RESOURCE_GROUP \
    --name $CONTAINER_NAME \
    --image $CONTAINER_IMAGE \
    --dns-name-label $DNS_NAME \
    --ports 80 \
    --azure-file-volume-account-name $ACI_PERS_STORAGE_ACCOUNT_NAME \
    --azure-file-volume-account-key $STORAGE_KEY \
    --azure-file-volume-share-name $ACI_PERS_SHARE_NAME \
    --azure-file-volume-mount-path /condarepo/
