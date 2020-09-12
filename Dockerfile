FROM openjdk:8u191-jre-alpine3.8

#Add CURL & JQ
RUN apk add curl jq

#Working Directory

WORKDIR /usr/share/abilash

#Volume mapping

VOLUME ["C:\Users\Abilash\Desktop\DockerMapper\results_Abilash","/usr/share/abilash/test-output"]


#Add Jars

ADD target/selenium-docker.jar selenium-docker.jar
ADD target/selenium-docker-tests.jar selenium-docker-tests.jar
ADD target/libs libs

#Suite File

ADD book-flight-module.xml book-flight-module.xml
ADD search-module.xml search-module.xml
ADD healthcheck.sh healthcheck.sh


#EntryPoint

ENTRYPOINT sh healthcheck.sh