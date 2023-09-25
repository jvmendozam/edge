FROM arm64v8/ruby:3.1.2
ENV APP_HOME=/ruby-app  \
    POSTGRES_USER=root \
    POSTGRES_PASSWORD=postgres

RUN mkdir $APP_HOME
WORKDIR $APP_HOME
VOLUME $APP_HOME/log

RUN apt-get update && apt-get install -y wget less groff
RUN apt-get update -qq && apt-get install -y build-essential default-libmysqlclient-dev libsnappy-dev libpq-dev cron libicu-dev
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD Gemfile Gemfile.lock $APP_HOME/
RUN bundle install
COPY . $APP_HOME/

EXPOSE 3001
CMD bundle exec rails s -b 0.0.0.0 -p 3001
