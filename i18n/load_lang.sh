#!/bin/bash

# Load language settings
if [ -f ~/.aicmd/config ]; then
    source ~/.aicmd/config
fi

# If no language is set, use Traditional Chinese by default
if [ -z "$LANGUAGE" ]; then
    LANGUAGE="zh_TW"
fi

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Load language file
if [ -f "$SCRIPT_DIR/${LANGUAGE}.sh" ]; then
    source "$SCRIPT_DIR/${LANGUAGE}.sh"
else
    # If the specified language file is not found, use English
    source "$SCRIPT_DIR/en.sh"
fi

# Get message function
get_message() {
    local key="$1"
    if [ -n "${messages[$key]}" ]; then
        echo "${messages[$key]}"
    else
        echo "Message not found: $key"
    fi
} 