#!/bin/bash
set -e  # stop on error
REPO_NAME=$(basename "$PWD")

echo "🧹 Nettoyage des anciens builds..."
rm -rf dist/*

echo "📥 Vérification de la présence d'un dépôt Git..."
if [ -d .git ]; then
  echo "📥 Récupération des dernières modifications depuis GitHub..."
  git pull
else
  cd ~/projects
  rm -rf "$REPO_NAME"
  git clone "https://github.com/ClaraVnk/$REPO_NAME.git"
  cd "$REPO_NAME"
fi

echo "🛠️ Construction du package..."
python -m build

echo "🚀 Upload sur PyPI avec twine..."
python3 -m twine upload --repository "$REPO_NAME"

echo "✅ Package publié avec succès !"
