    # 退出现有进程
    screen -S zgs_node_session -X quit
    # 启动
    cd ~/0g-storage-node/run
    screen -dmS zgs_node_session $HOME/0g-storage-node/target/release/zgs_node --config $HOME/0g-storage-node/run/config.toml
    echo '====================== 重启完成 ==========================='
