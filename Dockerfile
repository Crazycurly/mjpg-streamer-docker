FROM ubuntu:18.04

RUN apt-get update && apt-get install cmake make build-essential imagemagick subversion libv4l-dev checkinstall libjpeg-turbo8 libjpeg-turbo8-dev libv4l-0 -y

COPY ./mjpg-streamer-experimental /mjpg-streamer-experimental

WORKDIR /mjpg-streamer-experimental

RUN make USE_LIBV4L2=true clean all

RUN chmod +x docker-start.sh

EXPOSE 8080/TCP

ENTRYPOINT ["/mjpg-streamer-experimental/docker-start.sh"]