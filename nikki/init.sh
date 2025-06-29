# disable IPv6
/etc/init.d/odhcpd disable
echo 'net.ipv6.conf.all.disable_ipv6 = 1' >> /etc/sysctl.conf

# Failed to source defaults.vim
cat /usr/share/vim/vimrc | tee /usr/share/vim/defaults.vim

# add la command
echo "alias la='ls -lah'" | tee -a /etc/profile