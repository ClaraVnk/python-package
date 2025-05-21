#!/bin/bash
set -e  # stop on error
REPO_NAME=$(basename "$PWD")

echo "🧹 Cleaning old builds..."
rm -rf dist/*

echo "📥 Checking for the presence of a Git repository..."
if [ -d .git ]; then
  echo "📥 Pulling latest changes from GitHub..."
  git pull
else
  cd ~/projects
  rm -rf "$REPO_NAME"
  git clone "https://github.com/ClaraVnk/$REPO_NAME.git"
  cd "$REPO_NAME"
fi

echo "🛠️ Building the package..."
python -m build

echo "🚀 Uploading to PyPI with twine..."
python3 -m twine upload --repository "$REPO_NAME"

echo "✅ Package successfully published !"