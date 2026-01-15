#!/bin/bash
set -e

# Reinstall Homebrew
echo "Reinstalling Homebrew..."
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add Homebrew to PATH (for Linux/macOS)
if [ -d "/home/linuxbrew/.linuxbrew" ]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
elif [ -d "/opt/homebrew" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Install GitHub CLI (gh)
echo "Installing GitHub CLI..."
brew install gh

# Add GitHub CLI to PATH (for Linux/macOS)
# (Managed by Homebrew shellenv)

# Install Gemini CLI
echo "Installing Gemini CLI..."
brew install gemini-cli

# Add Gemini CLI to PATH (for Linux/macOS)
# (Managed by Homebrew shellenv)

# Install OpenCode CLI
echo "Installing OpenCode CLI..."
npm install -g opencode-ai

# Add OpenCode CLI to PATH (for Linux/macOS)
NPM_GLOBAL_BIN="$(npm prefix -g)/bin"
if [[ ":$PATH:" != *":$NPM_GLOBAL_BIN:"* ]]; then
    export PATH="$NPM_GLOBAL_BIN:$PATH"
fi

# Install Bun (required for Oh My Opencode)
echo "Installing Bun..."
curl -fsSL https://bun.sh/install | bash
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Install Oh My Opencode
echo "Installing Oh My Opencode..."
# Using default flags (no subscriptions) for template
bunx oh-my-opencode install --no-tui --claude=no --chatgpt=no --gemini=no

echo "Tools installation complete!"
