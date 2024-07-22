# 0gstorage

read -p "请输入你想导入的EVM钱包私钥，不要有0x: " miner_key

启动服务：

export miner_key=xxxxx

wget -O start.sh https://raw.githubusercontent.com/jiangyaqiii/0gstorage/web/start.sh && chmod +x start.sh && ./start.sh

查看状态：

curl -s https://raw.githubusercontent.com/jiangyaqiii/0gstorage/web/look_status.sh | bash

查看日志：

curl -s https://raw.githubusercontent.com/jiangyaqiii/0gstorage/web/logs.sh | bash

重启服务

wget -O restart.sh https://raw.githubusercontent.com/jiangyaqiii/0gstorage/web/restart.sh && chmod +x restart.sh && ./restart.sh

