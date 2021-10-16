#!/usr/bin/with-contenv bash

if [ ! -f /usr/local/bin/cloudflared ]; then
    ARCH="$(command arch)"
    if [ "${ARCH}" = "x86_64" ]; then
        ARCH="amd64"
    else
        exit 1
    fi

    curl -sS -L -X GET -o /usr/local/bin/cloudflared https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-${ARCH}
    chmod 0755 /usr/local/bin/cloudflared
else
    cloudflared update
fi
