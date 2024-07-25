    echo "DEBUG(1) > INFO(2) > WARN(3) > ERROR(4)"
    echo "DEBUG 等级日志文件最大，ERROR 等级日志文件最小"
    read -p "请选择日志等级(1-4): " level
    case "$level" in
        1)
            echo "debug,hyper=info,h2=info" > $HOME/0g-storage-node/run/log_config ;;
        2)
            echo "info,hyper=info,h2=info" > $HOME/0g-storage-node/run/log_config ;;
        3)
            echo "warn,hyper=info,h2=info" > $HOME/0g-storage-node/run/log_config ;;
        4)
            echo "error,hyper=info,h2=info" > $HOME/0g-storage-node/run/log_config ;;
    esac
    echo "修改完成，重新启动存储节点"
    # 退出现有进程
    screen -S zgs_node_session -X quit
    # 启动
    cd ~/0g-storage-node/run
    screen -dmS zgs_node_session $HOME/0g-storage-node/target/release/zgs_node --config $HOME/0g-storage-node/run/config.toml
    echo '====================== 重启成功 ==========================='
