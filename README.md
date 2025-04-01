# Lorex's AI Shell Command Helper

Ever wished your terminal understood plain English (or Chinese)? Tired of Googling "how to list files in Linux" for the 100th time? Meet AICMD - your new best friend in the command line! It's like having a super-smart assistant who actually understands what "show me what's in this folder" means (and won't judge you for asking).

Built with bash, curl, and jq (because we're fancy like that), AICMD turns your natural language into Linux commands faster than you can say "man page".

## Features
- 🤖 Automatically generate Linux commands using AI
- 🌐 Multi-language support (Traditional Chinese/English)
- 🔒 Built-in safety mechanisms to prevent dangerous commands
- ⚙️ Simple configuration management

## System Requirements

- Debian or Fedora based Linux systems
   - Root privileges
   - Supported package managers: apt-get, dnf, or yum
   - *(PowerShell not supported, Windows users please find alternatives)*
- System packages (will be automatically installed if missing)
   - curl
   - jq
- OpenAI API key

## Installation

1. Copy-paste this magic spell into your terminal:
```bash
curl -sSL https://raw.githubusercontent.com/Lorex/aicmd/main/install.sh | bash -s -- install
```
2. Select language (Traditional Chinese/English)
3. Enter your OpenAI API key

## Usage

### The `ai` Command (Your New Best Friend)

Just tell it what you want, like you're talking to a very smart rubber duck:

```bash
$ ai who am i?
> Command: whoami    # AI generated command
> Execute? (y/n) y   # Enter y to execute
yourDaddy            # Execution result
```

### Safety First: The `[[UNSAFE]]` Tag

Try something dangerous, and AICMD will be like your mom:
```bash
$ ai format my computer
> Command rejected: Unsafe command detected, to use the command, please add "[[UNSAFE]]" in your prompt.
i.e. "ai format disk" -> "ai format disk [[UNSAFE]]" or "[[UNSAFE]] ai format disk"
```

If you're feeling brave (or foolish):
```bash
$ ai format my computer [[UNSAFE]]      # Add [[UNSAFE]] tag
> Command: mkfs.ext4 /dev/sda1         # AI will generate the correct command
> Execute? (y/n) n                     # Enter n to cancel if you're unsure
> Cancelled.
```

### Language Switching

You can switch languages using these methods:

1. Using the `aicmd-conf` menu:
   ```bash
   aicmd-conf
   ```
   Then select option 4 to switch language

2. Direct command:
   ```bash
   aicmd-conf lang
   ```

3. Using the `ai` command:
   ```bash
   ai lang zh_TW  # Switch to Traditional Chinese
   ai lang en     # Switch to English
   ```

## Management Tool

AICMD provides the `aicmd-conf` command for configuration management:

1. The menu way (for bash babies):
   ```bash
   aicmd-conf
   ```
   Then select an option for configuration management
   ```bash
   $ ./aicmd-conf 
   Please select an action:
   1. Install AICMD
   2. Uninstall AICMD
   3. Set API Key
   4. Change Language
   ```

2. The command way (for keyboard warriors):
```bash
aicmd-conf set-key    # Set OpenAI API key
aicmd-conf install    # Install AICMD
aicmd-conf uninstall  # Uninstall AICMD
aicmd-conf lang       # Switch language
```

## Uninstallation

To uninstall AICMD, run:

```bash
sudo aicmd-conf uninstall
```

## Important Notes

- Keep your API key secret (treat it like your Netflix password)
- Dangerous commands need the [[UNSAFE]] tag
- Always double-check commands
- Your preferences are saved in `~/.aicmd/config`

## License

This project is licensed under the Apache 2.0 License. See the [LICENSE](LICENSE) file for details.

## Contributing

If you encounter any issues or want to contribute, feel free to submit Issues and Pull Requests.