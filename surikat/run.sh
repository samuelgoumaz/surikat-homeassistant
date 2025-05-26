#!/bin/bash

set -e

echo "[INFO] Surikat Add-on démarré"

# === Chemins relatifs
SRC_COMPONENT="./custom_components"
DST_COMPONENT="/config/custom_components/surikat"

# === Vérifier que la source existe
if [ ! -d "$SRC_COMPONENT" ]; then
  echo "❌ Le dossier source $SRC_COMPONENT est introuvable. Vérifie ton arborescence."
  exit 1
fi

# === Supprimer l'ancienne intégration
if [ -d "$DST_COMPONENT" ]; then
  echo "[INFO] Suppression de l'intégration existante dans $DST_COMPONENT..."
  rm -rf "$DST_COMPONENT"
fi

# === Copier l'intégration
echo "[INFO] Copie de $SRC_COMPONENT vers $DST_COMPONENT..."
mkdir -p "$(dirname "$DST_COMPONENT")"
cp -r "$SRC_COMPONENT" "$DST_COMPONENT"
echo "[✅] Intégration copiée."

# === Démarrer un serveur HTTP
echo "[INFO] Lancement du serveur HTTP sur le port 8000..."
python3 -m http.server 8000 --bind 0.0.0.0
