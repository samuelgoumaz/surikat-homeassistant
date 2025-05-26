#!/bin/bash

set -e

echo "[INFO] Add-on started"

python3 -m http.server 8000 --bind 0.0.0.0