FROM teddysun/v2ray

# 设置工作目录
WORKDIR /etc/v2ray

# 创建配置文件
RUN echo '{"inbounds":[{"port":443,"protocol":"vmess","settings":{"clients":[{"id":"de04add9-5c68-8bab-950c-08cd5320df18","level":1,"alterId":0}]}}],"outbounds":[{"protocol":"freedom","settings":{}},{"protocol":"blackhole","settings":{},"tag":"blocked"}],"routing":{"rules":[{"type":"field","ip":["geoip:private"],"outboundTag":"blocked"}]}}' > config.json

# 暴露端口
EXPOSE 443

# 启动命令
CMD ["v2ray", "run", "-c", "/etc/v2ray/config.json"]
