FROM alpine:3.10

RUN wget https://github.com/dalance/svlint/releases/download/v0.4.2/svlint-v0.4.2-x86_64-lnx.zip \
    && unzip svlint-v0.4.2-x86_64-lnx.zip \
    && mv svlint /bin/ \
    && rm svlint-v0.4.2-x86_64-lnx.zip

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
