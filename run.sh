#!/bin/bash

set -e

echo "[INFO] Surikat Add-on démarré"

# === Chemins
SRC_COMPONENT="/custom_components/surikat"
DST_COMPONENT="/config/custom_components/surikat"

# === Supprimer l'ancienne intégration si elle existe
if [ -d "$DST_COMPONENT" ]; then
  echo "[INFO] Suppression de l'intégration existante dans $DST_COMPONENT..."
  rm -rf "$DST_COMPONENT"
  echo "[✅] Ancienne version supprimée."
fi

# === Copier l'intégration depuis le dépôt vers Home Assistant
echo "[INFO] Copie de l'intégration depuis $SRC_COMPONENT vers $DST_COMPONENT..."
mkdir -p "$(dirname "$DST_COMPONENT")"
cp -r "$SRC_COMPONENT" "$DST_COMPONENT"
echo "[✅] Intégration copiée."

# === Démarrer un serveur HTTP
echo "[INFO] Lancement du serveur HTTP sur le port 8000..."
python3 -m http.server 8000 --bind 0.0.0.0
