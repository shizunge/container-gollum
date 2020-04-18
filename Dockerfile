FROM ruby:2.6-alpine3.9
RUN apk update && \
    apk add --no-cache cmake git icu-libs icu-dev make libcurl curl-dev g++ ruby ruby-dev && \
    rm -rf /var/cache/apk/* && \
    gem install github-linguist && \
    gem install github-markdown && \
    gem install gollum
RUN gem install commonmarker
RUN gem install RedCloth
RUN gem install rdoc -v 3.6.1
RUN gem install org-ruby
RUN gem install creole 
RUN gem install wikicloth
RUN gem install asciidoctor
RUN apk del cmake make g++
WORKDIR /wiki
ENTRYPOINT ["gollum", "--port", "8080"]
EXPOSE 8080
