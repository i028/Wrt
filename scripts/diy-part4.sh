rm -rf packages
rm -rf "*.manifest"
rm -rf $(find ./ -type f -name "*sha256sums*")
rename -v "s/config.*/${{ env.iTAG }}.config/" *
rename -v "s/.*.manifest/${{ env.iTAG }}.manifest/" *
rename -v "s/.*rootfs/${{ env.iTAG }}-rootfs/" *
rename -v "s/.*kernel/${{ env.iTAG }}-kernel/" *
rename -v "s/.*combined/${{ env.iTAG }}/" *
ls | xargs -i tar zcvf {}.tar.gz {} --remove-files
