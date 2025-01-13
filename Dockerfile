FROM alpine/java:22-jdk AS  dist-alpine

ARG KEYCLOAK_VERSION 999.0.0-SNAPSHOT
ARG KEYCLOAK_DIST=https://github.com/keycloak/keycloak/releases/download/$KEYCLOAK_VERSION/keycloak-$KEYCLOAK_VERSION.tar.gz

ADD $KEYCLOAK_DIST /tmp/keycloak/


RUN set -eux ; \
    apk add --no-cache bash curl tar gzip

ENV LANG en_US.UTF-8

# If it is a local tar archive then it is unpacked, if from remote is just downloaded.
RUN set -eux; \
    cd /tmp/keycloak ; \
    tar -xvf keycloak-*.tar.gz ; \
    rm -f keycloak-*.tar.gz ; \
    mv keycloak-* /opt/keycloak ; \
    mkdir -p /opt/keycloak/data ; \
    chmod -R g+rwX /opt/keycloak

RUN echo "keycloak:x:0:root" >> /etc/group && \
    echo "keycloak:x:1000:0:keycloak user:/opt/keycloak:/sbin/nologin" >> /etc/passwd

USER 1000

EXPOSE 8080
EXPOSE 8443

ENTRYPOINT [ "/opt/keycloak/bin/kc.sh" ]
