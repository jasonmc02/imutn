FROM ruby:2.2.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev imagemagick
WORKDIR /tmp
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install
RUN mkdir /imutn
WORKDIR /imutn
ADD . /imutn
CMD ["bundle", "exec", "puma", "-Cconfig/puma.rb", "-btcp://127.0.0.1:3000"]