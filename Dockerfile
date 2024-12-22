FROM teddysun/v2ray

# 设置工作目录
WORKDIR /etc/v2ray

# 创建配置文件
COPY <<EOF /etc/v2ray/config.json
{
  "inbounds": [{
    "port": ${PORT},
    "protocol": "vmess",
    "settings": {
      "clients": [
        {
          "id": "${UUID}",
          "alterId": 0
        }
      ]
    },
    "streamSettings": {
      "network": "ws",
      "wsSettings": {
        "path": "/ws"
      }
    }
  }],
  "outbounds": [{
    "protocol": "freedom",
    "settings": {}
  }]
}
EOF

# 暴露端口
EXPOSE ${PORT}

# 启动命令
CMD ["v2ray", "run", "-c", "/etc/v2ray/config.json"]
