# 开启 irqbalance
cat <<EOL >> package/base-files/files/etc/uci-defaults/99-irqbalance-settings
#!/bin/sh
# 开启 irqbalance
# 修改 option enabled '0' 为 option enabled '1'
sed -i "s/option enabled '0'/option enabled '1'/g" /etc/config/irqbalance

# 取消 option interval '10' 前面的 # 号
sed -i "s/#option interval '10'/option interval '10'/g" /etc/config/irqbalance

exit 0
EOL


cat <<EOL >> package/base-files/files/etc/uci-defaults/99-MzWrt-settings
#!/bin/sh

# 设置主机名
uci set system.@system[0].hostname='MzWrt'

# 设置 2.4GHz 频段的国家为中国
uci set wireless.radio0.country='CN'
# 设置 5GHz 频段的国家为中国
uci set wireless.radio1.country='CN'

# 信道设置
uci set wireless.radio0.channel='13'  # 设置 2.4GHz 信道为 13
uci set wireless.radio1.channel='36'  # 设置 5GHz 信道为 36

# 设置 2.4GHz 频段的无线模式（支持 802.11n，20MHz 或 40MHz，最大带宽 40MHz）
uci set wireless.radio0.htmode='HT40'  # 设置 2.4GHz 频段为 40MHz 带宽

# 设置 5GHz 频段的无线模式为 VHT160（最大带宽 160MHz）
uci set wireless.radio1.htmode='VHT160'  # 设置 5GHz 带宽为 160MHz

# 开启 Beamforming 功能
uci set wireless.radio0.beamforming='1'  # 开启 2.4GHz 的 Beamforming
uci set wireless.radio1.beamforming='1'  # 开启 5GHz 的 Beamforming

# 开启 MU-MIMO 支持
uci set wireless.radio1.mu_mimo='1'  # 开启 5GHz 的 MU-MIMO

# 开启 OFDMA 支持
uci set wireless.radio1.ofdma='1'    # 开启 5GHz 的 OFDMA

# 设置 2.4GHz SSID 名称为 MzWrt-2.4G
uci set wireless.default_radio0.ssid='MzWrt-2.4G'

# 设置 5GHz SSID 名称为 MzWrt-5G
uci set wireless.default_radio1.ssid='MzWrt-5G'

# 提交无线配置
uci commit wireless

# 重启网络
/etc/init.d/network restart

# 如果您确实需要重启系统或修改主机名，也可以执行
# 提交主机名配置
uci commit system
# 重启系统
# /etc/init.d/system restart

EOL
