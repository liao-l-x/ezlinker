FROM alpine
LABEL author="wwhai"
LABEL emai="cnwwhai@gmail.com"
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories
RUN apk --update add nginx
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./index.zip /EZLINKER/html
EXPOSE 80
CMD ["nginx","-g","daemon off;"]