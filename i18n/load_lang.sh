#!/bin/bash

# 載入語言設定
if [ -f ~/.aicmd/config ]; then
    source ~/.aicmd/config
fi

# 如果沒有設定語言，預設使用繁體中文
if [ -z "$LANGUAGE" ]; then
    LANGUAGE="zh_TW"
fi

# 取得腳本所在目錄
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 載入語言文件
if [ -f "$SCRIPT_DIR/${LANGUAGE}.sh" ]; then
    source "$SCRIPT_DIR/${LANGUAGE}.sh"
else
    # 如果找不到指定的語言文件，使用英文
    source "$SCRIPT_DIR/en.sh"
fi

# 取得訊息函數
get_message() {
    local key="$1"
    if [ -n "${messages[$key]}" ]; then
        echo "${messages[$key]}"
    else
        echo "Message not found: $key"
    fi
} 