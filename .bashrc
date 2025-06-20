# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

eval "$(starship init bash)"
alias ls='lsd'
alias ll='lsd -la'
alias rc='vim ~/.config/hypr/hyprland.conf'
alias fastfetch='fastfetch -c .config/fastfetch/conf'
export GTK_THEME=Catppuccin-Macchiato-Standard-Mauve-Dark

### RANDOM COLOR SCRIPT ###
#colorscript random

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

