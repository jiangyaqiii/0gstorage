sudo apt-get update -y
sudo apt-get install clang cmake build-essential git screen cargo -y


# 安装 Go
sudo rm -rf /usr/local/go
curl -L https://go.dev/dl/go1.22.0.linux-amd64.tar.gz | sudo tar -xzf - -C /usr/local
echo 'export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin' >> $HOME/.bash_profile
export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin
source $HOME/.bash_profile


# 克隆仓库
git clone -b v0.3.4 https://github.com/0glabs/0g-storage-node.git

# 进入对应目录构建
cd 0g-storage-node
git submodule update --init

# 构建代码
echo "准备构建，该步骤消耗一段时间。请保持 SSH 不要断开。看到 Finish 字样为构建完成。"
cargo build --release

# 编辑配置

#read -p "请输入你想导入的EVM钱包私钥，不要有0x: " miner_key
sed -i '
s|# rpc_listen_address = ".*"|rpc_listen_address = "0.0.0.0:5678"|
s|# network_boot_nodes = \[\]|network_boot_nodes = \[\"/ip4/54.219.26.22/udp/1234/p2p/16Uiu2HAmTVDGNhkHD98zDnJxQWu3i1FL1aFYeh9wiQTNu4pDCgps\",\"/ip4/52.52.127.117/udp/1234/p2p/16Uiu2HAkzRjxK2gorngB1Xq84qDrT4hSVznYDHj6BkbaE4SGx9oS\",\"/ip4/18.167.69.68/udp/1234/p2p/16Uiu2HAm2k6ua2mGgvZ8rTMV8GhpW71aVzkQWy7D37TTDuLCpgmX\"\]|
s|# log_contract_address = ""|log_contract_address = "0x8873cc79c5b3b5666535C825205C9a128B1D75F1"|
s|# mine_contract_address = ""|mine_contract_address = "0x85F6722319538A805ED5733c5F4882d96F1C7384"|
s|# blockchain_rpc_endpoint = ".*"|blockchain_rpc_endpoint = "https://evm.rpc.0gchain.josephtran.xyz/"|
s|# log_sync_start_block_number = 0|log_sync_start_block_number = 802|
s|# miner_key = ""|miner_key = "'$miner_key'"|
' $HOME/0g-storage-node/run/config.toml

# 启动
cd ~/0g-storage-node/run
screen -dmS zgs_node_session $HOME/0g-storage-node/target/release/zgs_node --config $HOME/0g-storage-node/run/config.toml


echo '====================== 安装完成 ==========================='

cd
rm start.sh
