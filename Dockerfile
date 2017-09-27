FROM alpine:3.6

ENV JAVA_VERSION=9
ENV JAVA_UPDATE=181
ENV JAVA_HOME="/usr/lib/jvm/default-jvm"

RUN apk add --no-cache --virtual=build-dependencies wget ca-certificates unzip
WORKDIR /tmp

RUN wget --header "Cookie: oraclelicense=accept-securebackup-cookie;" "http://download.java.net/java/jdk${JAVA_VERSION}-alpine/archive/${JAVA_UPDATE}/binaries/jdk-${JAVA_VERSION}-ea+${JAVA_UPDATE}_linux-x64-musl_bin.tar.gz"


RUN tar -xzf "jdk-${JAVA_VERSION}-ea+${JAVA_UPDATE}_linux-x64-musl_bin.tar.gz"
RUN mkdir -p "/usr/lib/jvm"
RUN mv "/tmp/jdk-${JAVA_VERSION}" "/usr/lib/jvm/java-${JAVA_VERSION}-oracle"
RUN ln -s "java-${JAVA_VERSION}-oracle" "$JAVA_HOME"
RUN ln -s "$JAVA_HOME/bin/"* "/usr/bin/"
RUN rm "/tmp/jdk-${JAVA_VERSION}-ea+${JAVA_UPDATE}_linux-x64-musl_bin.tar.gz"

## Clean unneeded files

# RUN apk del build-dependencies
WORKDIR /
