# php-conventional-changelog Docker


This Dockerfile lets you build and use an image with [PHP Conventional Changelog](https://github.com/marcocesarato/php-conventional-changelog) ready.

All credit for the application `php-conventional-changelog` goes to **https://github.com/marcocesarato**.


## How does this work ?
This image download [PHP Conventional Changelog](https://github.com/marcocesarato/php-conventional-changelog) using composer and copy several bash scripts (shortcuts) in the final container.

During the build, you can modify **3** arguments:
- **COMPOSER_TAG**: The composer docker image tag to use (by default `latest`). Full list [here](https://hub.docker.com/_/composer/tags)
- **COMPOSER_ARGS**: Additional arguments for composer (by default `-o`)
- **PHP_CONVENTIONAL_CHANGELOG_VERSION**: Version of the tool to download (by default `^1`)

## How to use ?

### 1) Build the image locally

First of all, clone this repo
```bash
    git clone https://github.com/BaptisteContreras/php-conventional-changelog-docker.git
```

Then go into the cloned repo and build the image

```bash
docker build  -t php-conventional-changelog .
```

Or with arguments if needed

```bash
DOCKER_BUILDKIT=1 docker build --build-arg COMPOSER_TAG=latest --build-arg COMPOSER_ARGS="-o" --build-arg COMPOSER_ARGS="^1" -t php-conventional-changelog .
```

```bash 
docker run -it php-conventional-changelog sh
```

In the container you have these helper scripts :

- `conventional-changelog`: execute the tool
- `changelog`: an alias of `conventional-changelog`
- `release`: execute with ``--commit``
- `release-major`: execute with ``--commit --major``
- `release-minor`: execute with ``--commit --minor``
- `release-patch`: execute with ``--commit --patch``

Then, you should refer to the [official documentation](https://github.com/marcocesarato/php-conventional-changelog/tree/main#-configuration) of the tool.

Of course, once build, this image can be used in CI/CD pipelines.