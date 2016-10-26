# deploy.sh
#!/bin/bash

# Exit on any error
set -e

echo $GCLOUD_SERVICE_KEY | base64 --decode > ${HOME}/gcloud-service-key.json
sudo /opt/google-cloud-sdk/bin/gcloud docker push us.gcr.io/${PROJECT_NAME}/jasonnic-hubot
sudo chown -R ubuntu:ubuntu /home/ubuntu/.kube
kubectl patch deployment docker-hello-google -p '{"spec":{"template":{"spec":{"containers":[{"name":"jasonnic-hubot","image":"us.gcr.io/default-ecs-cluster/jasonnic-hubot:'"$CIRCLE_SHA1"'"}]}}}}'

sudo /opt/google-cloud-sdk/bin/gcloud --quiet components update
sudo /opt/google-cloud-sdk/bin/gcloud auth activate-service-account --key-file ${HOME}/gcloud-service-key.json
sudo /opt/google-cloud-sdk/bin/gcloud config set project $GCLOUD_PROJECT
