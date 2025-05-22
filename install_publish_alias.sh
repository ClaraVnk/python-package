#!/bin/bash
set -e

# Variables
SCRIPT_URL="https://raw.githubusercontent.com/ClaraVnk/python-package/main/python-package.sh"
SCRIPT_PATH="$HOME/python-package.sh"
ALIAS_NAME="publishpy"
BASHRC="$HOME/.bashrc"

echo "📥 Téléchargement du script depuis GitHub..."
curl -L -o "$SCRIPT_PATH" "$SCRIPT_URL"

echo "🔧 Rendre le script exécutable..."
chmod +x "$SCRIPT_PATH"

# Vérifier si l'alias existe déjà dans .bashrc
if grep -Fxq "alias $ALIAS_NAME='bash $SCRIPT_PATH'" "$BASHRC"
then
    echo "ℹ️ L'alias $ALIAS_NAME existe déjà dans $BASHRC"
else
    echo "📝 Ajout de l'alias $ALIAS_NAME dans $BASHRC"
    echo "alias $ALIAS_NAME='bash $SCRIPT_PATH'" >> "$BASHRC"
    echo "✅ Alias ajouté. Rechargez votre terminal ou exécutez : source $BASHRC"
fi

echo "🎉 Installation terminée. Utilisez la commande '$ALIAS_NAME' pour publier votre package."