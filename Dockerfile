FROM teddysun/v2ray

# 设置工作目录
WORKDIR /etc/v2ray

# 创建配置文件
RUN echo '{"inbounds":[{"port":10000,"protocol":"vmess","settings":{"clients":[{"id":"de04add9-5c68-8bab-950c-08cd5320df18","alterId":0}]},"streamSettings":{"network":"ws","wsSettings":{"path":"/ws"}}}],"outbounds":[{"protocol":"freedom","settings":{}}]}' > config.json

# 暴露端口
EXPOSE 10000

# 启动命令
CMD ["v2ray", "run", "-c", "/etc/v2ray/config.json"]
