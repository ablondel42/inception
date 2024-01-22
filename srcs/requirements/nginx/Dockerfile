FROM alpine:3.14
RUN apk update
RUN apk add --no-cache --quiet --update nginx openssl
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes \
	-out /etc/nginx/ssl/ablondel.42.fr.crt \	
	-keyout /etc/nginx/ssl/ablondel.42.fr.key \
	-subj "/C=BE/ST=BR/L=Brussels/O=19/OU=42/CN=ablondel.42.fr/UID=ablondel"
RUN mkdir -p /var/run/nginx
COPY conf/nginx.conf /etc/nginx/http.d/default.conf
EXPOSE 443
CMD [ "nginx", "-g", "daemon off;" ]
