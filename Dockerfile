FROM ruby:2.6.6

RUN apt-get update -qq && \
  apt-get install -y build-essential libssl-dev nodejs libpq-dev libsasl2-dev

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt update && apt install yarn

ENV WORK_ROOT /src
ENV APP_HOME $WORK_ROOT/myapp/
ENV LANG C.UTF-8
ENV GEM_HOME $WORK_ROOT/bundle
ENV BUNDLE_BIN $GEM_HOME/gems/bin
ENV PATH $GEM_HOME/bin:$BUNDLE_BIN:$PATH

RUN mkdir -p $APP_HOME

RUN gem install bundler:2.2.0

RUN bundle config --path=$GEM_HOME

WORKDIR $APP_HOME

ADD Gemfile Gemfile.lock ./
RUN bundle install

ADD package.json yarn.lock ./
RUN yarn install

ADD . $APP_HOME

EXPOSE 3000

ENTRYPOINT bash -c "rm -f tmp/pids/server.pid && bundle exec rails s -b 0.0.0.0 -p 3000"
