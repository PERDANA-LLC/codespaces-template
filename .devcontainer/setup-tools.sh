#!/bin/bash
set -e

# Update Homebrew
echo "Updating Homebrew..."
brew update

# Install GitHub CLI (gh)
echo "Installing GitHub CLI..."
brew install gh

# Install Gemini CLI
echo "Installing Gemini CLI..."
brew install gemini-cli

# Install OpenCode CLI
echo "Installing OpenCode CLI..."
npm install -g opencode-ai

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
