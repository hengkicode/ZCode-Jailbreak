#!/usr/bin/env bash
# ==============================================================================
# ZCODE :: AUTONOMOUS POWER CORE & JAILBREAK ENGINE (LINUX / MACOS)
# Operator: Hengki · Core: Protocol v2.5 · Systems & Dual-Use Technical Unlock
# ==============================================================================

set -e

C_RESET="\033[0m"
C_BOLD="\033[1m"
G_CYAN="\033[38;2;56;189;248m"
G_MINT="\033[38;2;74;222;128m"
G_DARK="\033[38;2;115;115;125m"

echo -e "\n${G_CYAN}${C_BOLD}=== [ZCode Autonomous Power Core Installer v2.5] ===${C_RESET}"
echo -e "${G_DARK}Deploying global AGENTS.md, slash commands, and systems skills...${C_RESET}\n"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ZCODE_ROOT="$HOME/.zcode"
COMMANDS_DIR="$ZCODE_ROOT/commands"
SKILLS_DIR="$ZCODE_ROOT/skills"
CLI_DIR="$ZCODE_ROOT/cli"
AGENTS_ROOT="$HOME/.agents"

mkdir -p "$COMMANDS_DIR" "$SKILLS_DIR" "$CLI_DIR" "$AGENTS_ROOT/commands" "$AGENTS_ROOT/skills"

if [ -f "$SCRIPT_DIR/AGENTS.md" ]; then
    cp -f "$SCRIPT_DIR/AGENTS.md" "$ZCODE_ROOT/AGENTS.md"
    echo -e "${G_MINT}[OK]${C_RESET} Deployed Core Instructions -> $ZCODE_ROOT/AGENTS.md"
fi

if [ -d "$SCRIPT_DIR/.zcode/commands" ]; then
    cp -rf "$SCRIPT_DIR/.zcode/commands/"* "$COMMANDS_DIR/"
    cp -rf "$SCRIPT_DIR/.zcode/commands/"* "$AGENTS_ROOT/commands/"
    echo -e "${G_MINT}[OK]${C_RESET} Injected Slash Commands (/godmode, /deep, /re, /systems, /audit, /telemetry)"
fi

if [ -d "$SCRIPT_DIR/.zcode/skills" ]; then
    cp -rf "$SCRIPT_DIR/.zcode/skills/"* "$SKILLS_DIR/"
    cp -rf "$SCRIPT_DIR/.zcode/skills/"* "$AGENTS_ROOT/skills/"
    echo -e "${G_MINT}[OK]${C_RESET} Installed Skills (systems-core, binary-triage)"
fi

cat << 'EOF' > "$CLI_DIR/config.json"
{
  "skills": {
    "enabled": true
  },
  "hooks": {
    "enabled": true
  },
  "plugins": {}
}
EOF
echo -e "${G_MINT}[OK]${C_RESET} Activated Engine Hooks & Skills in $CLI_DIR/config.json"

echo -e "\n${G_CYAN}${C_BOLD}[!] Installation Succeeded.${C_RESET}"
echo -e "${G_DARK}Please restart ZCode to refresh active memory buffers.${C_RESET}\n"
