FROM debian:8.2
RUN apt-get -y update && apt-get install -y \
  curl \
  openjdk-7-jdk \
  unzip \
  && apt-get clean 
RUN curl -O https://downloads.gradle.org/distributions/gradle-2.10-bin.zip 
RUN unzip gradle-2.10-bin.zip
COPY code /code

