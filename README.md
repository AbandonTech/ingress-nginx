# ingress-nginx

Custom IngressNginx base, adding custom error pages.

## Setup

### Install Package Manager
Install [yarn](https://yarnpkg.com/). 
```shell
yarn install
```

### Run Dev Server
After changing a file, refresh the page on your browser.

```shell
yarn run dev
```

### Build Static Site

```shell
yarn run build
```

### Build Docker Container

```shell
docker build . -t ingress-nginx:local
```