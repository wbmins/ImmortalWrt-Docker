FROM wbmins/openwrt:latest

LABEL org.opencontainers.image.authors="wbmins"

COPY init.sh /tmp/init.sh

RUN wget -O - https://github.com/nikkinikki-org/OpenWrt-nikki/raw/refs/heads/main/feed.sh | ash \
    && mkdir -p /var/lock \
    && opkg update \
    && opkg install luci-i18n-nikki-zh-cn \
    && chmod +x /tmp/init.sh \
    && /tmp/init.sh \
    && find /tmp /var -type f ! -name 'resolv.conf' -exec rm -f {} +