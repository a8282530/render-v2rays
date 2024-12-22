# 使用官方镜像
FROM teddysun/v2ray

# 工作目录
WORKDIR /etc/v2ray

# 复制配置文件
COPY config.json /etc/v2ray/

# 暴露端口
EXPOSE $PORT

# 修改启动命令
CMD ["v2ray", "run", "-c", "/etc/v2ray/config.json"]
