ARG COMPOSER_TAG=latest

FROM composer:$COMPOSER_TAG as builder-composer

ARG COMPOSER_ARGS=-o
ARG PHP_CONVENTIONAL_CHANGELOG_VERSION="^1"

WORKDIR /conventional-changelog-src

RUN composer require marcocesarato/php-conventional-changelog:$PHP_CONVENTIONAL_CHANGELOG_VERSION $COMPOSER_ARGS

FROM php:8.1-cli-bullseye

RUN mkdir -p /conventional-changelog-src

COPY --from=builder-composer /conventional-changelog-src/vendor /conventional-changelog-src

COPY conventional-changelog.sh /usr/bin/conventional-changelog
COPY changelog.sh /usr/bin/changelog
COPY release.sh /usr/bin/release
COPY release-patch.sh /usr/bin/release-patch
COPY release-minor.sh /usr/bin/release-minor
COPY release-major.sh /usr/bin/release-major

RUN apt-get update
RUN apt-get install -y git

WORKDIR /app