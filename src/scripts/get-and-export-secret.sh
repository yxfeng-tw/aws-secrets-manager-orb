#!/bin/bash

secretName=$1
secretKey=$2
exportedVariable=$3

secretValue=$(aws secretsmanager get-secret-value --secret-id "${secretName}" | jq --raw-output ".SecretString" | jq -r ."${secretKey}")
export exportedVariable=$secretValue
echo $exportedVariable
