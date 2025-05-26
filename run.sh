#!/usr/bin/env bash
set -e

echo "Listing contents of /config before write test:"
ls -l /config || echo "Failed to list /config"

echo "Testing write access to /config..."

if touch /config/write_test.txt 2>/dev/null; then
  echo "Write test PASSED"
  rm /config/write_test.txt
else
  echo "Write test FAILED: /config is read-only"
  exit 1
fi

echo "Copying custom component to /config/custom_components/surikat"

mkdir -p /config/custom_components/surikat

cp -r /app/custom_components/surikat/* /config/custom_components/surikat/

echo "Custom component copied successfully."

while true; do sleep 60; done