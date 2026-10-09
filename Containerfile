FROM registry.access.redhat.com/ubi9/openjdk-17-runtime

WORKDIR /opt/seneid

COPY dist/seneid-distribution.tar.gz /tmp/seneid-distribution.tar.gz

RUN tar -xzf /tmp/seneid-distribution.tar.gz \
    -C /opt/seneid \
    --strip-components=1 \
    && rm -f /tmp/seneid-distribution.tar.gz

EXPOSE 8080

ENTRYPOINT ["/opt/seneid/bin/kc.sh"]
CMD ["start-dev"]
