#!/bin/bash
#=================================================
# MZwrt script
#=================================================   

##配置IP
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate

##更改主机名
sed -i "s/hostname='.*'/hostname='MzWrt'/g" package/base-files/files/bin/config_generate

#删除默认后台密码
sed -i '/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF/d' package/lean/default-settings/files/zzz-default-settings

##加入作者信息
sed -i "s/DISTRIB_DESCRIPTION='*.*'/DISTRIB_DESCRIPTION='MzWrt-'/g"  package/lean/default-settings/files/zzz-default-settings
echo -e "[35m~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~[0m
[35m\    ____                 _       __     __  /[0m
[34m\   / __ \____  ___  ____| |     / /____/ /_ /[0m
[36m\  / / / / __ \/ _ \/ __ \ | /| / / ___/ __/ /[0m
[32m\ / /_/ / /_/ /  __/ / / / |/ |/ / /  / /_   /[0m
[32m\ \____/ .___/\___/_/ /_/|__/|__/_/   \__/   /[0m
[33m\     /_/                                    /[0m
[33m\  M Z W r t  By  https://github.com/mzwrt   /[0m
[31m~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~[0m" > package/base-files/files/etc/banner
