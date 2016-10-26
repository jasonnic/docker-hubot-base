# deploy.sh
#!/bin/bash

# Exit on any error
set -e

sudo /opt/google-cloud-sdk/bin/gcloud docker push us.gcr.io/${PROJECT_NAME}/jasonnic-hubot
sudo chown -R ubuntu:ubuntu /home/ubuntu/.kube
kubectl patch deployment jasonnic-hubot -p '{"spec":{"template":{"spec":{"containers":[{"name":"jasonnic-hubot","image":"us.gcr.io/default-ecs-cluster/jasonnic-hubot:'"$CIRCLE_SHA1"'"}]}}}}'
