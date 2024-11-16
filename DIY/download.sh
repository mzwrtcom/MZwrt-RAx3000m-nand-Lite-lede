#!/bin/bash
#=================================================
# MZwrt script
#================================================= 
        rm -rf bin
        # 获取 GitHub 最新发布的版本（使用 GitHub API）
        latest_release_url="https://api.github.com/repos/mzwrtcom/MZwrt-RAx3000m-nand-Lite-lede/releases/latest"
        # 获取最新发布的 JSON 数据
        latest_release_info=$(curl -s $latest_release_url)
        # 提取下载链接（假设文件名是 MzWrt_firmware.tar.gz）
        download_url=$(echo $latest_release_info | jq -r '.assets[] | select(.name == "MzWrt_firmware.tar.gz") | .browser_download_url')
        # 下载文件
        curl -L -o MzWrt_firmware.tar.gz $download_url
        # 解压下载的文件
        tar -xzvf MzWrt_firmware.tar.gz

        exit 0
