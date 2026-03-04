#!/bin/bash
# deploy.sh — Add, commit and push all changes to GitHub Pages
# Usage: bash deploy.sh "Opis promjene"

set -e

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$REPO_DIR"

MSG="${1:-Dodaj novi sadržaj}"

git add -A
git commit -m "$MSG" || echo "Nema novih promjena za commitati."
git push origin main

echo ""
echo "✅ Objavljeno! Stranica se ažurira za ~1 minutu."
echo "🌐 Pogledaj na: https://$(git remote get-url origin | sed 's/.*github.com[:/]//' | sed 's/.git$//').github.io/"
