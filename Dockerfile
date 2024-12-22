FROM teddysun/v2ray

# 设置环境变量
ENV PORT=$PORT
ENV UUID=$UUID

# 暴露端口
EXPOSE $PORT

# 创建并写入启动脚本
WORKDIR /etc/v2ray
RUN echo '#!/bin/sh' > start.sh && \
    echo 'v2ray run -c - << EOF' >> start.sh && \
    echo '{' >> start.sh && \
    echo '  "inbounds": [{' >> start.sh && \
    echo '    "port": '$PORT',' >> start.sh && \
    echo '    "protocol": "vmess",' >> start.sh && \
    echo '    "settings": {' >> start.sh && \
    echo '      "clients": [' >> start.sh && \
    echo '        {' >> start.sh && \
    echo '          "id": "'$UUID'",' >> start.sh && \
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
    chmod +x start.sh

# 启动命令
CMD ["/etc/v2ray/start.sh"]
