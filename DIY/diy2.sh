#!/bin/bash
#=================================================
# MZwrt script
#=================================================   

##配置IP
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate

##更改主机名
sed -i "s/hostname='.*'/hostname='MzWrt'/g" package/base-files/files/bin/config_generate

##加入作者信息
sed -i "s/DISTRIB_DESCRIPTION='*.*'/DISTRIB_DESCRIPTION='MzWrt'/g"  package/lean/default-settings/files/zzz-default-settings
cp -af feeds/extraipk/patch/diy/banner-MZwrt  package/base-files/files/etc/banner

##WiFi
sed -i "s/OpenWrt/MzWrt-2.4G/g" package/lean/mt/drivers/mt_wifi/files/mt7915.1.2G.dat
sed -i "s/OpenWrt/MzWrt-5G/g" package/lean/mt/drivers/mt_wifi/files/mt7915.1.5G.dat
# 配置wifi密码
sed -i "s/AuthMode=OPEN/AuthMode=WPA2PSK/g" package/lean/mt/drivers/mt_wifi/files/mt7915.1.2G.dat
sed -i "s/AuthMode=OPEN/AuthMode=WPA2PSK/g" package/lean/mt/drivers/mt_wifi/files/mt7915.1.5G.dat
sed -i "s/WPAPSK1=12345678/WPAPSK1=admin123/g" package/lean/mt/drivers/mt_wifi/files/mt7915.1.2G.dat
sed -i "s/WPAPSK1=12345678/WPAPSK1=admin123/g" package/lean/mt/drivers/mt_wifi/files/mt7915.1.5G.dat
#配置国家代码为CN
sed -i "s/CountryCode=US/CountryCode=CN/g" package/lean/mt/drivers/mt_wifi/files/mt7915.1.2G.dat
sed -i "s/CountryCode=US/CountryCode=CN/g" package/lean/mt/drivers/mt_wifi/files/mt7915.1.5G.dat
#配置信道
sed -i "s/Channel=6/Channel=13/g" package/lean/mt/drivers/mt_wifi/files/mt7915.1.2G.dat
sed -i "s/Channel=36/Channel=56/g" package/lean/mt/drivers/mt_wifi/files/mt7915.1.5G.dat
