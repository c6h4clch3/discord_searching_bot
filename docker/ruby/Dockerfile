FROM ruby:latest

RUN bundler -v

RUN mkdir -p /data
VOLUME ["/data"]
WORKDIR /data
VOLUME ["/bundle"]
ENV BUNDLE_PATH=/bundle

ENTRYPOINT ["bundle"]
CMD ["exec ruby -h"]
