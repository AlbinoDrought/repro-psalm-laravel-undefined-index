FROM webdevops/php:7.4
WORKDIR /app
COPY . /app
RUN /app/reproduce.sh
