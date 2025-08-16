FROM alpine:3.21
RUN	apk update && apk upgrade && apk add nginx
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]