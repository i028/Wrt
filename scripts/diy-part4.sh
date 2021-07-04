#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
#sed -i '$a src-git small https://github.com/i028/small' feeds.conf.default
sed -i 'src-git opentopd  https://github.com/sirpdboy/sirpdboy-package' feeds.conf.default
sed -i '$a src-git helloworld https://github.com/C-oss/helloworld' feeds.conf.default

# Add luci-theme-argon
git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon
rm -rf ../lean/luci-theme-argon

git clone https://github.com/i028/luci-theme-netgear
rm -rf ../lean/luci-theme-netgear

git clone https://github.com/C-oss/luci-theme-atmaterial package/luci-theme-atmaterial
git clone https://github.com/C-oss/luci-theme-darkmatter package/luci-theme-darkmatter

# Add filebrowser
#git clone https://github.com/C-oss/luci-app-filebrowser package/luci-app-filebrowser
