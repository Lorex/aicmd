# Lorex's AI Command Helper

AICMD 是一個 Linux 指令輔助工具，能讓使用者透過自然語言描述來執行系統操作，或是修復你打爛的指令。

## 功能
- 🤖 使用 AI 自動生成 Linux 指令
- 🔧 自動修復執行失敗的指令
- 🌐 支援多語言（繁體中文/English）
- 🔒 內建安全機制，防止手殘執行到危險指令
- ⚙️ 簡單的配置管理系統

## 安裝要求

- Linux 作業系統
- root 權限（用於安裝）
- 支援的套件管理器：apt-get、dnf 或 yum
- OpenAI API 金鑰

## 安裝方法

1. 下載 AICMD 安裝腳本
   ```bash
   git clone https://github.com/Lorex/aicmd.git
   ```
2. 執行安裝命令：
   ```bash
   sudo ./aicmd-conf install
   ```
3. 按照提示選擇語言（繁體中文/English）
4. 輸入您的 OpenAI API 金鑰

## 使用方法

### 一般模式

使用自然語言描述您想要執行的操作：

```bash
ai 列出當前目錄下的所有文件
```

### 修復模式

如果某個命令執行失敗，可以使用修復模式：

```bash
ai fix 修復上一個失敗的命令
```

### 安全機制

對於危險命令（如 `rm -rf /`、`mkfs` 等），需要添加 `[[UNSAFE]]` 標記：

```bash
ai 格式化磁盤 [[UNSAFE]]
```

### 語言切換

您可以使用以下方式切換語言：

1. 使用 `aicmd-conf` 選單：
   ```bash
   aicmd-conf
   ```
   然後選擇選項 4 進行語言切換

2. 直接使用命令：
   ```bash
   aicmd-conf lang
   ```

3. 使用 `ai` 命令：
   ```bash
   ai lang zh_TW  # 切換到繁體中文
   ai lang en     # 切換到英文
   ```

## 配置管理

使用以下命令管理配置：

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
- 使用危險命令時請務必謹慎，並添加 `[[UNSAFE]]` 標記
- 建議在執行生成的命令前仔細檢查
- 語言設定會保存在 `~/.aicmd/config` 文件中

## 授權

本專案採用 MIT 授權條款。詳見 [LICENSE](LICENSE) 文件。

## 貢獻

歡迎提交 Issue 和 Pull Request 來改進這個專案。

## 作者

[您的名字/組織]

## 致謝

- OpenAI 提供強大的 API 服務
- 所有貢獻者的付出 