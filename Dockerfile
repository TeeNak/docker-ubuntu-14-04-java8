FROM ubuntu:14.04
MAINTAINER TeeNak <teenak77@gmail.com>

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y software-properties-common
#    apt-get install -y software-properties-common && \ 
#    apt-add-repository ppa:webupd8team/java && \
#    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886 && \
#    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
#    apt-get update -y && \
#    apt-get install -y oracle-java8-installer && \
#    apt-get install -y oracle-java8-unlimited-jce-policy && \
#    rm -rf /var/lib/apt/lists/* && \
#    rm -rf /var/cache/oracle-jdk8-installer

ENV JAVA_VERSION_MAJOR 8
ENV JAVA_VERSION_MINOR 101
ENV JAVA_VERSION_BUILD 13
ENV JAVA_DOWNLOAD_HASH 0da788060d494f5095bf8624735fa2f1

COPY ./jdk-${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-linux-x64.tar.gz /
RUN mkdir -p /usr/lib/jvm \
    && cd /usr/lib/jvm \
    && tar xf /jdk-${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-linux-x64.tar.gz \
    && rm /jdk-${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-linux-x64.tar.gz \
    && update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk1.${JAVA_VERSION_MAJOR}.0_${JAVA_VERSION_MINOR}/bin/java" 1

ENV JAVA_HOME /usr/lib/jvm/jdk1.${JAVA_VERSION_MAJOR}.0_${JAVA_VERSION_MINOR}

ENV PATH $JAVA_HOME/bin:$PATH

