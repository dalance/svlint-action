FROM alpine:3.18

ARG version="v0.9.0"

RUN wget https://github.com/dalance/svlint/releases/download/$version/svlint-$version-x86_64-lnx.zip \
    && unzip svlint-$version-x86_64-lnx.zip \
    && mv ./bin/* /bin/ \
    && rm svlint-$version-x86_64-lnx.zip

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
