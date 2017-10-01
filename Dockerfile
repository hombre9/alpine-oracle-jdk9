FROM alpine:3.6

ENV JAVA_VERSION=9
ENV JAVA_UPDATE=181
ENV JAVA_HOME="/usr/lib/jvm/default-jvm"

RUN apk add --no-cache --virtual=build-dependencies wget ca-certificates unzip && \
    cd /tmp && \
    wget --header "Cookie: oraclelicense=accept-securebackup-cookie;" "http://download.java.net/java/jdk${JAVA_VERSION}-alpine/archive/${JAVA_UPDATE}/binaries/jdk-${JAVA_VERSION}-ea+${JAVA_UPDATE}_linux-x64-musl_bin.tar.gz" && \
    tar -xzf "jdk-${JAVA_VERSION}-ea+${JAVA_UPDATE}_linux-x64-musl_bin.tar.gz" && \
    mkdir -p "/usr/lib/jvm" && \
    mv "/tmp/jdk-${JAVA_VERSION}" "/usr/lib/jvm/java-${JAVA_VERSION}-oracle" && \
    ln -s "java-${JAVA_VERSION}-oracle" "$JAVA_HOME" && \
    ln -s "$JAVA_HOME/bin/"* "/usr/bin/" && \
    rm -f "$JAVA_HOME/lib/src.zip" && \
    apk del build-dependencies

WORKDIR /
