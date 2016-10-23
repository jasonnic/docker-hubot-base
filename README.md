
# Hubot in Docker Container 

[![](https://badge.imagelayers.io/jasonnic/docker-hubot-base:latest.svg)](https://imagelayers.io/?images=jasonnic/docker-hubot-base:latest 'Get your own badge on imagelayers.io')

## Original Concept found on Philipps wonderful Blog [http://garbe.io/blog/2015/05/11/how-to-run-hubot-in-docker-on-aws-ec2-container-services-part-1/](http://garbe.io/blog/2015/05/11/how-to-run-hubot-in-docker-on-aws-ec2-container-services-part-1/)
The idea of using Docker, CircleCI and ECS are all his.  I wanted to do the same things with GCP.



##ECS Instructions
@Todo


##GCP Instructions
[Create GCP Service Account](https://cloud.google.com/storage/docs/authentication#service_accounts)
base64 the JSON File Created for the service Account
add `GCLOUD_SERVICE_KEY` to enviornment variables

## Hubot Adapters

* hubot-diagnostics
* hubot-help
* hubot-heroku-keepalive
* hubot-google-images
* hubot-google-translate
* hubot-pugme
* hubot-maps
* hubot-redis-brain
* hubot-rules
* hubot-shipit

