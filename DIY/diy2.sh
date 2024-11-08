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
echo -e "\e[38;5;21m~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\e[0m
\e[38;5;81m\    \e[38;5;222m____                 _       __     __  / \e[0m
\e[38;5;81m\   \e[38;5;190m/ __ \____  ___  ____| |     / /____/ /_ / \e[0m
\e[38;5;81m\  \e[38;5;45m/ / / / __ \/ _ \/ __ \ | /| / / ___/ __/ / \e[0m
\e[38;5;81m\ \e[38;5;68m/ /_/ / /_/ /  __/ / / / |/ |/ / /  / /_   / \e[0m
\e[38;5;81m\ \e[38;5;110m\____/ .___/\___/_/ /_/|__/|__/_/   \__/   / \e[0m
\e[38;5;81m\     \e[38;5;214m/_/                                    / \e[0m
\e[38;5;81m\  \e[38;5;33mM Z W r t  By  \e[38;5;82mhttps://github.com/mzwrt\e[0m   / \e[0m
\e[38;5;21m~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\e[0m" > package/base-files/files/etc/banner
