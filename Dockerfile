FROM alpine:3.7
RUN apk add --no-cache \
    coreutils \
    gcc \
    g++ \
    python2 \
    python3 \
    openjdk8

ENV JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk
ENV PATH="$JAVA_HOME/bin:${PATH}" 

ADD https://github.com/aniketnk/code-runner/releases/download/1.0/code-runner /src/runner
RUN chmod ugo+x /src/runner

WORKDIR /src
# CMD [ "/src/runner" ]
ENTRYPOINT [ "/src/runner" ]