mkdir -p /var/lock

# Disable IPv6
/etc/init.d/odhcpd disable
echo 'net.ipv6.conf.all.disable_ipv6 = 1' >> /etc/sysctl.conf

# Failed to source defaults.vim
cat /usr/share/vim/vimrc | tee /usr/share/vim/defaults.vim

# Add la command
echo "alias la='ls -lah'" | tee -a /etc/profile

# Install nikki
wget -O - https://github.com/nikkinikki-org/OpenWrt-nikki/raw/refs/heads/main/feed.sh | ash
opkg update
opkg install luci-i18n-nikki-zh-cn

# Change ustc feeds
sed -i 's/downloads.openwrt.org/mirrors.ustc.edu.cn\/openwrt/g' /etc/opkg/distfeeds.conf

# Clean up temporary files
find /tmp /var -type f ! -name 'resolv.conf' -exec rm -f {} +