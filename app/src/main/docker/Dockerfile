FROM openjdk:8-jdk-alpine
LABEL author="wwhai"
LABEL emai="cnwwhai@gmail.com"
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories
ADD ezlinker_app_0.0.1.jar ezlinker_app_0.0.1.jar
EXPOSE 2500
VOLUME "/APP"
CMD java -jar ezlinker_app_0.0.1.jar