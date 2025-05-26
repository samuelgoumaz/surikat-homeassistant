#!/usr/bin/env bash

echo "Copying custom component to /config/custom_components/surikat"

mkdir -p /config/custom_components/surikat
cp -r /app/custom_components/surikat/* /config/custom_components/surikat/

# Optionnel : tu peux déclencher un restart de Home Assistant via API ici si besoin

# Lancer ton service / script principal
exec python3 /app/main.py