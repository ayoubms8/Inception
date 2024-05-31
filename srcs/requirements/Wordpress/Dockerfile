FROM debian:bullseye

COPY ./tools/script.sh ./script.sh

RUN apt-get update && apt-get install -y \
	zsh \
	php7.4-fpm \
	php7.4-mysql \
	php7.4-mbstring \
	curl \
	mariadb-client \
	&& rm -rf /var/lib/apt/lists/* \
	&& chmod +x script.sh

CMD ["./script.sh"]
