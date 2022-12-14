FROM node:16-alpine AS builder

WORKDIR /build

ADD package.json .
RUN yarn install --frozen-lockfile

ADD . .
RUN yarn build

FROM nginx:alpine

RUN rm /etc/nginx/conf.d/default.conf && \
    ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /build/pages /var/www/html/

CMD ["nginx", "-g", "daemon off;"]