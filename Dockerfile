FROM teddysun/v2ray

# 设置环境变量
ENV PORT=$PORT
ENV UUID=$UUID

# 暴露端口
EXPOSE $PORT

# 直接启动命令
CMD v2ray run -c - << EOF
{
  "inbounds": [{
    "port": $PORT,
    "protocol": "vmess",
    "settings": {
      "clients": [
        {
          "id": "$UUID",
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
