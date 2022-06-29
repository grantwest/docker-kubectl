#!/bin/bash
set -ex

KUBECTL_VERSION=$1
tags=("$@")

echo "${tags[@]/#/-t }"

docker build --pull \
  --build-arg KUBECTL_VERSION=$KUBECTL_VERSION \
  ${tags[@]/#/"-t docker.io/grantwest/kubectl:"} \
  .

docker run -it --rm docker.io/grantwest/kubectl:${tags[0]} kubectl --help
docker run -it --rm docker.io/grantwest/kubectl:${tags[0]} envsubst --version
docker run -it --rm docker.io/grantwest/kubectl:${tags[0]} printenv --version

for t in "${tags[@]}"
do
   : 
   docker push docker.io/grantwest/kubectl:$t
done