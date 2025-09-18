if status is-interactive
    # Enable vi key bindings
    fish_vi_key_bindings

    # Customize vi mode cursor
    set fish_cursor_default block
    set fish_cursor_insert line
    set fish_cursor_replace_one underscore
    set fish_cursor_visual block

    # Initialize Starship prompt if available
    if type -q starship
        starship init fish | source
    else
        echo "Starship not installed. Install with: curl -sS https://starship.rs/install.sh | sh" >&2
    end
end

# Environment variables
set -gx EDITOR nvim
set -gx TERM xterm-256color
set -gx LSCOLORS "exgxfxdacxDaDaxbadacex"

# Path additions
fish_add_path ~/bin
fish_add_path /usr/local/bin
fish_add_path ~/Library/Python/3.8/bin
fish_add_path /opt/homebrew/bin
fish_add_path ~/.npm-global/bin

# Aliases
alias vi=nvim
alias dc="docker compose"
alias domce="ssh root@ssh.domce.dk"
alias get-dev-ip='aws ec2 describe-instances --output=text --region=eu-central-1 --filters Name="tag:Name",Values="ECS - dev" --query "Reservations[*].Instances[*].PublicIpAddress"'

# Initialize tools
if type -q direnv
    direnv hook fish | source
end

# FZF integration
if test -f ~/.config/fish/functions/fzf_key_bindings.fish
    source ~/.config/fish/functions/fzf_key_bindings.fish
end
