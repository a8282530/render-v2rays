FROM teddysun/v2ray

# 设置环境变量
ENV PORT=$PORT
ENV UUID=$UUID

# 暴露端口
EXPOSE $PORT

# 创建配置文件
WORKDIR /etc/v2ray
RUN echo '{\n\
  "inbounds": [{\n\
    "port": '$PORT',\n\
    "protocol": "vmess",\n\
    "settings": {\n\
      "clients": [\n\
        {\n\
          "id": "'$UUID'",\n\
          "alterId": 0\n\
        }\n\
      ]\n\
    },\n\
    "streamSettings": {\n\
      "network": "ws",\n\
      "wsSettings": {\n\
        "path": "/ws"\n\
      }\n\
    }\n\
  }],\n\
  "outbounds": [{\n\
    "protocol": "freedom",\n\
    "settings": {}\n\
  }]\n\
}' > config.json

# 启动命令
CMD ["v2ray", "run", "-c", "/etc/v2ray/config.json"]
