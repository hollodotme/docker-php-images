# docker-backend-web

Docker image for web service in backend application.

This docker image is built on a daily basis via GitHub actions. 

## Features

* PHP 8 RC4 FPM
* Intl extension
* OPCache extension & config
* [Redis extension](https://github.com/phpredis/phpredis)
* PDO MySQL & PGSQL

## Usage

In a `docker-compose.yml`:

```yml
services:
  web:
    image: "docker.pkg.github.com/from-home-de/docker-backend-web/backend-web"
    volumes:
      - "./:/repo"
    restart: "on-failure"
```

## Building for development

```bash
make build
```

## Pushing the development version to GitHub

This will push a :0.0.0-dev version to the GitHub package registry

```bash
make push
```
