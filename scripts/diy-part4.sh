#!/bin/bash

echo "iTAG=lede-$(date +"%y.%m.%d%H%M")" >> $GITHUB_ENV
mkdir -p ./artifact/buildinfo
cp -rf $(find openwrt/bin/targets/ -type f -name "*.buildinfo" -o -name "*.manifest") ./artifact/buildinfo/
cd openwrt/bin/targets/*/*
rm -rf packages
rm -rf "*.manifest"
rm -rf $(find ./ -type f -name "*sha256sums*")
rename -v "s/config.*/${{ env.iTAG }}.config/" *
rename -v "s/.*.manifest/${{ env.iTAG }}.manifest/" *
rename -v "s/.*rootfs/${{ env.iTAG }}-rootfs/" *
rename -v "s/.*kernel/${{ env.iTAG }}-kernel/" *
rename -v "s/.*combined/${{ env.iTAG }}/" *
ls | xargs -i tar zcvf {}.gz {} --remove-files
echo "FIRMWARE=$PWD" >> $GITHUB_ENV
