tail -f "$(find ~/0g-storage-node/run/log/ -type f -printf '%T+ %p\n' | sort -r | head -n 1 | cut -d' ' -f2-)"
