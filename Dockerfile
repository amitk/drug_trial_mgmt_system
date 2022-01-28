from ruby:3.0.0

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs npm
RUN npm install -g yarn

WORKDIR /app
COPY . /app/

RUN yarn install
RUN bundle install

CMD ["rails", "server", "-b", "0.0.0.0"]

EXPOSE 3000
