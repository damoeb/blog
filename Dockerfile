FROM debian:bullseye-slim
RUN apt-get update && apt-get -y install hugo git
WORKDIR /opt/migor-blog
COPY . .
RUN ./build.sh

FROM nginx:1.19-alpine

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=0 /opt/migor-blog/public /usr/share/nginx/html

