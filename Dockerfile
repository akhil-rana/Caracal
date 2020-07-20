FROM node:14-stretch-slim
RUN apt-get update  &&  apt-get upgrade -y  &&  apt-get install -y git
RUN mkdir /root/src
COPY . /root/src
WORKDIR /root/src
RUN npm install
ARG viewer
RUN if [ -z ${viewer} ]; then git clone https://github.com/camicroscope/camicroscope.git; else git clone https://github.com/camicroscope/camicroscope.git --branch=$viewer; fi
EXPOSE 8010
CMD node caracal.js
