FROM ruby:3.0.0

RUN curl -fsSL https://deb.nodesource.com/setup_12.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && \
  apt-get install -y build-essential libssl-dev nodejs yarn libpq-dev libsasl2-dev

ENV WORK_ROOT /src
ENV APP_HOME $WORK_ROOT/myapp/
ENV LANG C.UTF-8

RUN mkdir -p $APP_HOME

RUN gem install bundler:2.2.6

WORKDIR $APP_HOME

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY package.json yarn.lock ./
RUN yarn install

COPY . $APP_HOME

RUN chmod +x ./entrypoint.sh

EXPOSE 3000

ENTRYPOINT ["./entrypoint.sh"]

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
