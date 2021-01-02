FROM cirrusci/flutter:beta AS builder

RUN flutter config --enable-web
WORKDIR /kiryu_finance
ADD . .
RUN flutter build web

FROM nginx
COPY --from=builder /kiryu_finance/build/web /usr/share/nginx/html
COPY --from=builder /kiryu_finance/web/nginx/default.conf /etc/nginx/conf.d/default.conf
EXPOSE 8080