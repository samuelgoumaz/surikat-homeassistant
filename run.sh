#!/usr/bin/env bash
set -e

echo "Copying custom component to /config/custom_components/surikat"

# Crée le dossier cible s’il n’existe pas
mkdir -p /config/custom_components/surikat

# Copie récursive des fichiers du custom component depuis /app vers /config
cp -r /custom_components/surikat/* /config/custom_components/surikat/

echo "Custom component copied successfully."