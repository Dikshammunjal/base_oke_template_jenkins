#!/bin/sh -x

PASSWORD=$1
USERNAME=$2
REGION=$3
MS=$4
GITCOMMIT=$5
IMAGE=$6

export local_REGISTRY_TOKEN=echo $PASSWORD | sed 's/[!@#$%^&*()-]/\\\&/g'

docker login -u ''$USERNAME'' -p echo ''${local_REGISTRY_TOKEN}'' ''$REGION''.ocir.io"


docker tag ''$MS'':''$GITCOMMIT'' ''$IMAGE''

docker push ''$IMAGE''
