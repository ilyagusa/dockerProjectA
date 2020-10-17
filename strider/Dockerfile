FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
  apt-get install -y git python3-pip curl  mongodb

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs 
RUN apt-get install -y ruby ruby-all-dev
RUN gem install bundler
RUN npm install -g node-gyp

RUN mkdir -p /home/strider && mkdir -p /opt/strider
RUN adduser --disabled-password --gecos "" --home /home/strider strider
RUN chown -R strider:strider /home/strider
RUN chown -R strider:strider /opt/strider
RUN ln -s /opt/strider/src/bin/strider /usr/local/bin/strider
USER strider
ENV HOME /home/strider

RUN git clone https://github.com/Strider-CD/strider /opt/strider/src && \
  cd /opt/strider/src && git checkout v1.11.0 && npm install
EXPOSE 3000
USER root
WORKDIR  /opt/strider/src
RUN apt-get install -y jq
ENV NODE_ENV=production
RUN chmod -R 777 ./bin/
#CMD ["npm", "start"]


