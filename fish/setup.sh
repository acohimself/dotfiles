#!/bin/bash
# Setup script for fish configuration on new machines

echo "Setting up fish configuration..."

# Check if fish is installed
if ! command -v fish &> /dev/null; then
    echo "Error: fish is not installed. Please install fish first."
    exit 1
fi

# Install Fisher if not already installed
if [ ! -f "$HOME/.config/fish/functions/fisher.fish" ]; then
    echo "Installing Fisher plugin manager..."
    fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher"
fi

# Update plugins
echo "Installing/updating fish plugins..."
fish -c "fisher update"

echo "Fish setup complete! Restart your shell or run 'exec fish'"