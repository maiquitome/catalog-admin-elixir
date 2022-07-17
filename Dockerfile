FROM elixir:1.13-slim

USER root

RUN apt-get update -y
RUN apt-get install inotify-tools -y

RUN useradd -ms /bin/bash elixir

USER elixir

WORKDIR /home/elixir/app

RUN mix local.hex --force && \
    mix local.rebar --force
    
COPY . .
    
# RUN mix do deps.get, deps.compile

EXPOSE 8000

CMD [ "sh", "-c", "tail -f /dev/null" ]