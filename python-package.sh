#!/bin/bash
set -e  # stop on error

echo "🧹 Nettoyage des anciens builds..."
rm -rf dist/*

echo "📥 Vérification de la présence d'un dépôt Git..."
if [ -d .git ]; then
  echo "📥 Récupération des dernières modifications depuis GitHub..."
  git pull
else
  echo "⚠️ Ce dossier n'est pas un dépôt Git, espèce de gourdasse. Voyons ce qu'on peut faire..."
  cd ~/projects
  rm -rf openstack-toolbox  # ⚠️ attention : suppression complète du dossier
  git clone https://github.com/ClaraVnk/openstack-toolbox.git
  cd openstack-toolbox
fi

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