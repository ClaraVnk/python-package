#!/bin/bash
set -e  # stop on error

echo "🧹 Nettoyage des anciens builds..."
rm -rf dist/*

echo "📥 Récupération des dernières modifications depuis GitHub..."
git pull

echo "🛠️ Construction du package..."
python -m build

echo -n "🔐 Veuillez saisir votre token API PyPI (entrée cachée) : "
read -s PYPI_API_TOKEN
echo

if [ -z "$PYPI_API_TOKEN" ]; then
  echo "❌ Token API PyPI non fourni."
  exit 1
fi

echo "🚀 Upload sur PyPI avec twine..."
python3 -m twine upload dist/* -u __token__ -p "$PYPI_API_TOKEN"

echo "✅ Package publié avec succès !"