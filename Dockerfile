FROM pushcorn/ubuntu:20.04

LABEL maintainer="joseph@pushcorn.com"

ARG RESILIO_SYNC_VERSION=2.7.*

RUN qd ubuntu:begin-apt-install \
        --repo "http://linux-packages.resilio.com/resilio-sync/deb resilio-sync non-free" \
        --key "https://linux-packages.resilio.com/resilio-sync/key.asc" \
    && apt-get -y install resilio-sync=$RESILIO_SYNC_VERSION \
    && qd ubuntu:end-apt-install \
    && rm -rf /etc/resilio-sync/* /home

EXPOSE 15555

CMD [":run-task", "--task", "start,resilio:start"]
