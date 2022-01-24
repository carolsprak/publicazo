# syntax=docker/dockerfile:1
FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /COM.DOCKER.DEVENVIRONMENTS.CODE
COPY . /COM.DOCKER.DEVENVIRONMENTS.CODE/
COPY Gemfile /COM.DOCKER.DEVENVIRONMENTS.CODE/Gemfile
COPY Gemfile.lock /COM.DOCKER.DEVENVIRONMENTS.CODE/Gemfile.lock
COPY Rakefile /COM.DOCKER.DEVENVIRONMENTS.CODE/Rakefile
RUN rm Gemfile.lock
RUN bundle install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 5003

# Configure the main process to run when running the image
RUN rake db:setup
CMD ["rails", "s", "-p", "5003", "-b", "0.0.0.0"]
