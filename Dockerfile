FROM webdevops/php:8.0
WORKDIR /app
COPY . /app
RUN /app/reproduce.sh
