FROM pushcorn/ubuntu:latest

LABEL maintainer="joseph@pushcorn.com"

ARG BUILD_ID=NA
ENV BUILD_ID=$BUILD_ID

RUN PACKAGE_URL=$(curl -# --progress-bar https://help.resilio.com/hc/en-us/articles/206178924-Installing-Sync-package-on-Linux | grep -oP "(https.*amd64.deb)") \
    && curl -# "$PACKAGE_URL" -o /tmp/pkg.deb \
    && apt install /tmp/pkg.deb \
    && rm -rf /tmp/*

COPY .qd /root/.qd

EXPOSE 8888 55555

CMD [":run-task", "--task", "init,resilio:start"]
