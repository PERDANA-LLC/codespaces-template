#!/bin/bash
set -e

# ==========================================
# 1. Shell Profile Detection
# ==========================================
case "$SHELL" in
  */zsh) SHELL_PROFILE="$HOME/.zshrc" ;;
  */bash) SHELL_PROFILE="$HOME/.bashrc" ;;
  *) SHELL_PROFILE="$HOME/.profile" ;;
esac

echo "Detected shell profile: $SHELL_PROFILE"

add_to_profile() {
    local line="$1"
    if ! grep -qF "$line" "$SHELL_PROFILE"; then
        echo "$line" >> "$SHELL_PROFILE"
        echo "Added to profile: $line"
    fi
}

# ==========================================
# 2. Reinstall Homebrew
# ==========================================
echo "Reinstalling Homebrew..."
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Initialize Homebrew for this script execution
if [ -d "/home/linuxbrew/.linuxbrew" ]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
elif [ -d "/opt/homebrew" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -d "/usr/local" ]; then
    eval "$(/usr/local/bin/brew shellenv)"
fi

# ==========================================
# 3. Install GitHub CLI (gh)
# ==========================================
echo "Installing GitHub CLI..."
brew install gh

# Add GitHub CLI to PATH (Manual Management)
# We locate the specific install prefix for 'gh' and explicitly add its bin folder.
GH_PREFIX="$(brew --prefix gh)"
GH_BIN="$GH_PREFIX/bin"

# 1. Activate for current session
if [[ ":$PATH:" != *":$GH_BIN:"* ]]; then
    export PATH="$GH_BIN:$PATH"
fi

# 2. Persist for future sessions
echo "Manually adding gh to PATH..."
add_to_profile "# Manual GitHub CLI PATH"
add_to_profile "export PATH=\"$GH_BIN:\$PATH\""

# ==========================================
# 4. Install Gemini CLI
# ==========================================
echo "Installing Gemini CLI..."
# (Assuming gemini-cli is available in your taps)
brew install gemini-cli || echo "Warning: gemini-cli install failed (check tap names)."

# Add Gemini CLI to PATH (Manual Management)
# We locate the specific install prefix for 'gemini-cli' and explicitly add its bin folder.
GEMINI_PREFIX="$(brew --prefix gemini-cli)"
GEMINI_BIN="$GEMINI_PREFIX/bin"

# 1. Activate for current session
if [[ ":$PATH:" != *":$GEMINI_BIN:"* ]]; then
    export PATH="$GEMINI_BIN:$PATH"
fi

# 2. Persist for future sessions
echo "Manually adding gemini-cli to PATH..."
add_to_profile "# Manual Gemini CLI PATH"
add_to_profile "export PATH=\"$GEMINI_BIN:\$PATH\""

# ==========================================
# 5. Install OpenCode CLI
# ==========================================
echo "Installing OpenCode CLI..."
npm install -g opencode-ai

# Add OpenCode CLI to PATH (Manual Management)
NPM_GLOBAL_BIN="$(npm prefix -g)/bin"

if [[ ":$PATH:" != *":$NPM_GLOBAL_BIN:"* ]]; then
    export PATH="$NPM_GLOBAL_BIN:$PATH"
fi

add_to_profile "# Manual OpenCode CLI PATH"
add_to_profile "export PATH=\"$NPM_GLOBAL_BIN:\$PATH\""

# ==========================================
# 6. Install Bun
# ==========================================
echo "Installing Bun..."
curl -fsSL https://bun.sh/install | bash

# Add Bun to PATH (Manual Management)
export BUN_INSTALL="$HOME/.bun"
BUN_BIN="$BUN_INSTALL/bin"
export PATH="$BUN_BIN:$PATH"

add_to_profile "# Manual Bun PATH"
add_to_profile 'export BUN_INSTALL="$HOME/.bun"'
add_to_profile 'export PATH="$BUN_INSTALL/bin:$PATH"'

# ==========================================
# 7. Install Oh My Opencode
# ==========================================
echo "Installing Oh My Opencode..."
bunx oh-my-opencode install --no-tui --claude=no --chatgpt=no --gemini=no

echo ""
echo "Tools installation complete!"
echo "Run 'source $SHELL_PROFILE' to apply changes."