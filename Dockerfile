FROM ruby
RUN apt-get -y update && apt-get -y install libicu-dev cmake && rm -rf /var/lib/apt/lists/*
RUN gem install github-linguist
RUN gem install gollum
RUN gem install org-ruby  # optional
WORKDIR /wiki
ENTRYPOINT ["gollum", "--port", "8080"]
EXPOSE 8080
