#!/bin/bash
#=================================================
# MZwrt script
#================================================= 
#!/bin/bash

# 删除旧的 bin 文件夹
rm -rf bin

# 获取 GitHub 最新发布的版本（使用 GitHub API）
latest_release_url="https://api.github.com/repos/mzwrtcom/MZwrt-RAx300m-nand-Lite-lede/releases/latest"

# 获取最新发布的 JSON 数据
latest_release_info=$(curl -s $latest_release_url)

# 提取发布时间（ISO 8601 格式）
release_date=$(echo $latest_release_info | jq -r '.published_at')

# 获取当前日期的年份、月份、日、小时、分钟等
current_date=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

# 计算本周的开始日期（本周一）
start_of_week=$(date -u -d 'last monday' +"%Y-%m-%dT00:00:00Z")

# 打印调试信息
echo "Release date: $release_date"
echo "Start of this week: $start_of_week"

# 比较发布时间是否在本周内
if [[ "$release_date" < "$start_of_week" ]]; then
  echo "The release is not from this week. Exiting..."
  exit 0
fi

# 提取下载链接（假设文件名是 MzWrt_firmware.tar.gz）
download_url=$(echo $latest_release_info | jq -r '.assets[] | select(.name == "MzWrt_firmware.tar.gz") | .browser_download_url')

# 下载文件
echo "Downloading $download_url..."
curl -L -o MzWrt_firmware.tar.gz $download_url

# 解压下载的文件
echo "Extracting MzWrt_firmware.tar.gz..."
tar -xzvf MzWrt_firmware.tar.gz
mv MzWrt_firmware/bin bin

exit 0
