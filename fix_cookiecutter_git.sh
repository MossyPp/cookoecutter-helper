#!/bin/bash

set -e

# Find the generated project directory (should contain a .git folder)
echo "🔍 Searching for generated project directory with a .git folder..."
TARGET_DIR=$(find . -mindepth 1 -maxdepth 1 -type d -exec test -e "{}/.git" \; -print | head -n 1)

if [ -z "$TARGET_DIR" ]; then
  echo "❌ Could not find generated project directory with a .git folder."
  exit 1
fi

echo "📁 Found generated project directory: $TARGET_DIR"

# Remove inner .git to avoid conflicts
echo "🧹 Removing inner Git repo from $TARGET_DIR..."
rm -rf "$TARGET_DIR/.git"

# Move contents of the generated directory up to project root
echo "📦 Moving contents of $TARGET_DIR to current directory..."
shopt -s dotglob
mv "$TARGET_DIR"/* .
mv "$TARGET_DIR"/.* . 2>/dev/null || true  # move hidden files (except . and ..)
shopt -u dotglob

# Remove now-empty directory
rm -rf "$TARGET_DIR"

# Stage and commit changes
echo "📸 Staging and committing changes..."
git add .
git commit -m "Initialize project from Cookiecutter template"

echo "✅ Project successfully initialized and committed."
