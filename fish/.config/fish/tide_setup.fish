#!/usr/bin/env fish
# Tide configuration setup

# Skip the configuration wizard
set -U _tide_configure_on_startup false

# Configure Tide with saved settings
tide configure --auto --style=lean --prompt_colors='True color' --show_time=No --lean_prompt_height='Two lines' --prompt_connection=Disconnected --prompt_spacing=Sparse --icons='Many icons' --transient=No