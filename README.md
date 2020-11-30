# docker-php-images

Various PHP docker images for my projects

## re<sup>a</sup>dis images

* docker.pkg.github.com/hollodotme/docker-php-images/readis-php-71
* docker.pkg.github.com/hollodotme/docker-php-images/readis-php-72
* docker.pkg.github.com/hollodotme/docker-php-images/readis-php-73
* docker.pkg.github.com/hollodotme/docker-php-images/readis-php-74
* docker.pkg.github.com/hollodotme/docker-php-images/readis-php-80

### Includes

* PHP-FPM
* Xdebug
* Intl-Extension
* Redis-Extension

#### Build for development

```bash
make build-readis
```

#### Push dev version to GitHub

This will push a :0.0.0-dev version to the GitHub package registry

```bash
make push-readis
```

## Usage

In a `docker-compose.yml`:

```yml
services:
  web:
    image: "docker.pkg.github.com/hollodotme/docker-php-images/<image-name><:tag>"
    volumes:
      - "./:/repo"
    restart: "on-failure"
```