#!/bin/bash

set -e

echo "[INFO] Surikat Add-on démarré"

# === Chemins sources
SRC_COMPONENT="/custom_components/surikat"
SRC_JS="$SRC_COMPONENT/www/card-skeleton.js"

# === Chemins destination
DST_COMPONENT="/config/custom_components/surikat"
DST_JS_DIR="/config/www/surikat"
DST_JS="$DST_JS_DIR/card-skeleton.js"

# === Copier les fichiers Python de l'intégration
echo "[INFO] Copie de l'intégration dans $DST_COMPONENT..."
mkdir -p "$DST_COMPONENT"
cp -r "$SRC_COMPONENT"/*.py "$DST_COMPONENT/"
cp "$SRC_COMPONENT/manifest.json" "$DST_COMPONENT/"
echo "[✅] Intégration copiée."

# === Copier le fichier JS dans www
echo "[INFO] Copie de la custom card JS dans $DST_JS..."
mkdir -p "$DST_JS_DIR"
cp "$SRC_JS" "$DST_JS"
echo "[✅] JS copié avec succès."

# === Lancer un serveur HTTP (si nécessaire)
echo "[INFO] Démarrage du serveur HTTP sur le port 8000..."
python3 -m http.server 8000 --bind 0.0.0.0
