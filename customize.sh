#!/bin/bash
#===============================================
# 修改默认IP
sed -i 's/192.168.1.1/192.168.5.1/g' openwrt/package/base-files/files/bin/config_generate

# 修改默认主题
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# 修改主机名
#sed -i 's/OpenWrt/kenzo/g' package/base-files/files/bin/config_generate

#2. 自定义设置
#sed -i 's?zstd$?zstd ucl upx\n$(curdir)/upx/compile := $(curdir)/ucl/compile?g' tools/Makefile
#sed -i 's/$(TARGET_DIR)) install/$(TARGET_DIR)) install --force-overwrite/' package/Makefile
#sed -i 's/root:.*/root:$1$tTPCBw1t$ldzfp37h5lSpO9VXk4uUE\/:18336:0:99999:7:::/g' package/base-files/files/etc/shadow

#添加自定义插件库
sed -i '$a src-git smpackage https://github.com/kenzok8/small-package' feeds.conf.default

#设置内核版本为5.10
sed -i 's/KERNEL_PATCHVER:=5.4/KERNEL_PATCHVER:=5.10/g' ./target/linux/ramips/Makefile

#对于强迫症的同学（有报错信息、或Lean源码编译出错的情况），请尝试删除冲突的插件
rm -rf feeds/smpackage/{base-files,dnsmasq,firewall*,fullconenat,libnftnl,nftables,ppp,opkg,ucl,upx,vsftpd*,miniupnpd-iptables,wireless-regdb}
