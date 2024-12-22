FROM teddysun/v2ray

# 设置工作目录
WORKDIR /etc/v2ray

# 创建启动脚本
RUN echo '#!/bin/sh' > start.sh && \
    echo 'cat > config.json << EOF' >> start.sh && \
    echo '{' >> start.sh && \
    echo '  "inbounds": [{' >> start.sh && \
    echo '    "port": '"${PORT}"',' >> start.sh && \
    echo '    "protocol": "vmess",' >> start.sh && \
    echo '    "settings": {' >> start.sh && \
    echo '      "clients": [' >> start.sh && \
    echo '        {' >> start.sh && \
    echo '          "id": "'"${UUID}"'",' >> start.sh && \
    echo '          "alterId": 0' >> start.sh && \
    echo '        }' >> start.sh && \
    echo '      ]' >> start.sh && \
    echo '    },' >> start.sh && \
    echo '    "streamSettings": {' >> start.sh && \
    echo '      "network": "ws",' >> start.sh && \
    echo '      "wsSettings": {' >> start.sh && \
    echo '        "path": "/ws"' >> start.sh && \
    echo '      }' >> start.sh && \
    echo '    }' >> start.sh && \
    echo '  }],' >> start.sh && \
    echo '  "outbounds": [{' >> start.sh && \
    echo '    "protocol": "freedom",' >> start.sh && \
    echo '    "settings": {}' >> start.sh && \
    echo '  }]' >> start.sh && \
    echo '}' >> start.sh && \
    echo 'EOF' >> start.sh && \
    echo 'v2ray run -c config.json' >> start.sh && \
    chmod +x start.sh

# 暴露端口
EXPOSE ${PORT}

# 启动命令
CMD ["./start.sh"]
