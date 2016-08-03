FROM ubuntu:trusty
MAINTAINER Jason Nichols <jasonnic@gmail.com>
#Original Concept from Tatsu https://github.com/pgarbe/tatsu-hubot
# Prevent dpkg errors
ENV TERM=xterm-256color

# Set to local mirror
#RUN sed -i "s/http:\/\/archive./http:\/\/somearchive./g" /etc/apt/sources.list


# Install node and redis runtime
RUN apt-get update && \
    apt-get install -qy \
    expect redis-server nodejs npm

# Install python and pip
RUN apt-get update && \
    apt-get install -y python-pip && \
    pip install awscli

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN ln -s /usr/bin/nodejs /usr/bin/node

RUN npm install -g hubot coffee-script yo generator-hubot

RUN npm install npm -g

# Create hubot user
RUN	useradd -d /hubot -ms /bin/bash -U hubot
RUN chown -R hubot /hubot


# Log in as hubot user and change directory
USER	hubot
WORKDIR /hubot

#Environment
# time
ENV TZ JST-9

# Install hubot
RUN yo hubot --owner="Jason <jasonnic@gmail.com" --name="marvin3.0" --description="Marvin 3.0" --adapter=slack --defaults --allow-root

# Install adapters external functionality

ADD hubot/external-scripts.json /hubot/

# ADD hubot/scripts/hubot-lunch.coffee /hubot/scripts/

# And go
# CMD ["/bin/sh", "-c", "aws s3 cp --region eu-west-1 s3://pgarbe-secrets/env.sh .; . ./env.sh; bin/hubot --adapter slack"]
CMD ["bin/hubot", "--adapter", "slack"]