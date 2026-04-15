#!/bin/bash

KUBE_DIR="$HOME/.kube"

# Collect configs
configs=()

# Add dev configs
for f in "$KUBE_DIR/dev"/*; do
  configs+=("$f")
done

# Add prod configs
for f in "$KUBE_DIR/prod"/*; do
  configs+=("$f")
done

# Display menu
echo "Available kube configs:"
for i in "${!configs[@]}"; do
  name=$(basename "${configs[$i]}")
  echo "$((i+1))) $name"
done

# Ask user choice
echo -n "Choose a config (1-${#configs[@]}): "
read choice

# Validate input
if ! [[ "$choice" =~ ^[0-9]+$ ]] || [ "$choice" -lt 1 ] || [ "$choice" -gt "${#configs[@]}" ]; then
  echo "Invalid choice"
  exit 1
fi

selected="${configs[$((choice-1))]}"

# Copy to active config
rm "$KUBE_DIR/config"
cp "$selected" "$KUBE_DIR/config"

echo "Switched to: $(basename "$selected")"
