FROM alpine:3.14
 
RUN mkdir -p /srv/jekyll
WORKDIR /srv/jekyll

RUN  apk update && apk add --no-cache build-base
RUN  apk add ruby ruby-dev ruby-bundler bash
RUN  gem install bundler bigdecimal webrick json

COPY ./ /srv/jekyll

RUN  bundle update --bundler
RUN  bundle config set path 'vendor/bundle'
RUN  bundle install

EXPOSE 4000

CMD ["bundle", "exec", "jekyll", "serve", "--port", "4000", "--host", "0.0.0.0"]
