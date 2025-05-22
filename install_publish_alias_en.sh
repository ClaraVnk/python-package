#!/bin/bash
set -e

# Variables
SCRIPT_URL="https://raw.githubusercontent.com/ClaraVnk/python-package/main/python-package.sh"
SCRIPT_PATH="$HOME/python-package.sh"
ALIAS_NAME="publishpy"
BASHRC="$HOME/.bashrc"

echo "📥 Downloading the script from GitHub..."
curl -L -o "$SCRIPT_PATH" "$SCRIPT_URL"

echo "🔧 Making the script executable..."
chmod +x "$SCRIPT_PATH"

# Check if the alias already exists in .bashrc
if grep -Fxq "alias $ALIAS_NAME='bash $SCRIPT_PATH'" "$BASHRC"
then
    echo "ℹ️ The alias $ALIAS_NAME already exists in $BASHRC"
else
    echo "📝 Adding the alias $ALIAS_NAME to $BASHRC"
    echo "alias $ALIAS_NAME='bash $SCRIPT_PATH'" >> "$BASHRC"
    echo "✅ Alias added. Reload your terminal or run: source $BASHRC"
fi

echo "🎉 Installation complete. Use the command '$ALIAS_NAME' to publish your package."