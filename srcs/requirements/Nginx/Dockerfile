FROM debian:bullseye


COPY ./tools/script.sh ./script.sh

RUN apt-get update && apt-get install -y \
	nginx \
	openssl \
	ca-certificates \
	&& rm -rf /var/lib/apt/lists/* \
	&& chmod +x ./script.sh

COPY ./conf/nginx.conf /etc/nginx/sites-available/default

CMD ["./script.sh" ]