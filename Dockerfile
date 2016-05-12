FROM ruby:2.2.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev imagemagick
WORKDIR /tmp
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install
RUN mkdir /imutn
WORKDIR /imutn
ADD . /imutn
EXPOSE 3000
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]