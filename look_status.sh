#!/bin/bash

if screen -ls | grep -q "zgs_node_session"; then
    echo "0g 正在运行"
else
    echo "停止"
fi
