# Lorex's AI Shell Command Helper

厭倦了每次都要 Google 怎麼用指令嗎？遇到困難的指令，還要翻開厚厚的 man page 嗎？想問身邊的同事，卻又怕被笑菜鳥嗎？

現在，你只需要告訴 AICMD 你想做什麼，它就會自動生成對應的指令，再也不用擔心身邊的人會用同情的眼光看著你了！

## 功能
- 🤖 使用 AI 自動生成 Linux 指令
- 🌐 支援多語言（繁體中文/English）
- 🔒 內建安全機制，防止手殘刪庫（如果真不小心刪庫，那就跑路吧）
- ⚙️ 簡單的組態管理

## 系統要求

- Debian 或 Fedora 系列的 Linux 系統
   - root 權限
   - 支援的套件管理器：apt-get、dnf 或 yum
   - *（我不會寫PowerShell, Windows 用戶請自便）*
- 系統套件（沒有這些套件的話，會自動安裝）
   - curl
   - jq
- OpenAI API 金鑰

## 安裝方法

1. 使用以下一行指令安裝：

```bash
curl -sSL https://raw.githubusercontent.com/Lorex/aicmd/main/install.sh | bash -s -- install
```
2. 按照提示選擇語言（繁體中文/English）
3. 輸入您的 OpenAI API 金鑰

## 使用方法

### 使用 `ai` 指令

以自然語言描述您想要執行的操作，例如：

```bash
$ ai 我是誰?
> Command: whoami    # AI 生成的指令
> Execute? (y/n) y   # 輸入 y 執行指令
yourDaddy            # 執行結果
```

### 安全機制：`[[UNSAFE]]` 標記

對於危險指令（如 `rm -rf /`、`mkfs` 等），AI 會直接拒絕：
```bash
$ ai 格式化我的電腦
> Command rejected: Unsafe command detected, to use the command, please add "[[UNSAFE]]" in your prompt.
i.e. "ai format disk" -> "ai format disk [[UNSAFE]]" or "[[UNSAFE]] ai format disk"
```

如果你已經明白風險，且依然想要執行危險指令，可以在指令中添加 `[[UNSAFE]]` 標記：

```bash
$ ai 格式化我的電腦 [[UNSAFE]]      # 添加 [[UNSAFE]] 標記
> Command: mkfs.ext4 /dev/sda1     # AI 會照常生成正確的指令
> Execute? (y/n) n                 # 會怕的話，就輸入 n 取消執行，AI 不會笑你
> Cancelled.
```

### 語言切換

您可以使用以下方式切換語言：

1. 使用 `aicmd-conf` 選單：
   ```bash
   aicmd-conf
   ```
   然後選擇選項 4 進行語言切換

2. 直接使用指令：
   ```bash
   aicmd-conf lang
   ```

3. 使用 `ai` 指令：
   ```bash
   ai lang zh_TW  # 切換到繁體中文
   ai lang en     # 切換到英文
   ```

## 管理工具

AICMD 提供 `aicmd-conf` 指令來管理組態，您可以透過以下方式使用：

1. 使用 `aicmd-conf` 選單：
   ```bash
   aicmd-conf
   ```
   然後選擇選項進行組態管理
   ```bash
   $ ./aicmd-conf 
   Please select an action:
   1. Install AICMD           # 安裝 AICMD
   2. Uninstall AICMD        # 解除安裝 AICMD
   3. Set API Key            # 設定 OpenAI API 金鑰
   4. Change Language        # 切換語言
   ```
   

2. 使用以下指令管理配置：

```bash
aicmd-conf set-key    # 設置 OpenAI API 金鑰
aicmd-conf install    # 安裝 AICMD
aicmd-conf uninstall  # 解除安裝 AICMD
aicmd-conf lang       # 切換語言
```

## 解除安裝

要解除安裝 AICMD，執行：

```bash
sudo aicmd-conf uninstall
```

## 注意事項

- 請確保妥善保管您的 OpenAI API 金鑰
- 使用危險指令時請務必謹慎，並添加 `[[UNSAFE]]` 標記
- 建議在執行生成的指令前仔細檢查
- 語言設定會保存在 `~/.aicmd/config` 文件中

## 授權

本專案採用 Apache 2.0 授權條款。詳見 [LICENSE](LICENSE) 文件。

## 跳坑

若有任何問題或是你也想跳坑，歡迎提交 Issue 和 Pull Request。