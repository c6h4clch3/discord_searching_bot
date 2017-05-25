FROM ruby:latest

RUN bundler -v

RUN mkdir -p /data
VOLUME ["/data"]
WORKDIR /data
RUN pwd
RUN ls -al

ENTRYPOINT ["bundle"]
CMD ["exec ruby -h"]
