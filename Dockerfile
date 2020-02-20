FROM alpine:3.10

ARG version="v0.4.3"

RUN wget https://github.com/dalance/svlint/releases/download/$version/svlint-$version-x86_64-lnx.zip \
    && unzip svlint-$version-x86_64-lnx.zip \
    && mv svlint /bin/ \
    && rm svlint-$version-x86_64-lnx.zip

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
