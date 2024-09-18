#!/bin/bash

script_dir="$(pwd)"

# Function to prompt the user for input
prompt_user() {
    while true; do
        read -p "$1 [y/n]: " yn
        case $yn in
            [Yy]* ) return 0;;
            [Nn]* ) return 1;;
            * ) echo "Please answer yes [y] or no [n].";;
        esac
    done
}

# Function to safely copy files with user confirmation
safe_copy() {
    if [ -e "$1" ]; then
        if [ -e "$2" ]; then
            echo "File or directory $2 already exists."
            if prompt_user "Do you want to overwrite it?"; then
                rsync -a --delete "$1" "$2"
                echo "Updated: $2"
            else
                echo "Skipping: $2"
            fi
        else
            rsync -a --delete "$1" "$2"
            echo "Created: $2"
        fi
    else
        echo "Source not found: $1"
    fi
}

# Step 1: Restore Dotfiles
if prompt_user "Do you want to restore dotfiles (zsh configs, Kitty config, Fastfetch conf)?"; then
    echo "Restoring dotfiles..."

    echo "Restoring Zsh configs..."
    safe_copy "$script_dir/.zshrc" "$HOME/.zshrc"
    safe_copy "$script_dir/.zprofile" "$HOME/.zprofile"
    safe_copy "$script_dir/.zshenv" "$HOME/.zshenv"
    safe_copy "$script_dir/.zsh" "$HOME/.zsh"
    safe_copy "$script_dir/.config/zshrc.d" "$HOME/.config/zshrc.d"

    echo "Restoring Kitty config..."
    safe_copy "$script_dir/.config/kitty" "$HOME/.config/kitty"

    echo "Restoring Fastfetch conf..."
    safe_copy "$script_dir/.fastfetch_conf.jsonc" "$HOME/.fastfetch_conf.jsonc"

    echo "Restoring Oh My Zsh and Powerlevel10k..."
    safe_copy "$script_dir/.oh-my-zsh" "$HOME/.oh-my-zsh"
    safe_copy "$script_dir/.p10k.zsh" "$HOME/.p10k.zsh"

    echo "Dotfiles restored."
else
    echo "Skipping dotfiles restore."
fi

# Step 2: Restore GNOME Extensions
if prompt_user "Do you want to restore GNOME extensions? (You'll need to manually install them from the extensions.gnome.org site.)"; then
    EXTENSIONS_FILE="$script_dir/gnome_extensions_list.txt"
    if [ -f "$EXTENSIONS_FILE" ]; then
        echo "GNOME extensions list found. Please visit https://extensions.gnome.org/ and manually install the extensions listed below:"
        cat "$EXTENSIONS_FILE"
    else
        echo "GNOME extensions list not found, skipping."
    fi
else
    echo "Skipping GNOME extensions installation."
fi

# Step 4: Restore Fonts
if prompt_user "Do you want to restore fonts?"; then
    echo "Restoring fonts..."
    mkdir -p $HOME/.local/share/fonts
    safe_copy "$script_dir/.local/share/fonts" "$HOME/.local/share/fonts"
    safe_copy "$script_dir/.fonts" "$HOME/.fonts"

    echo "Fonts restored."
else
    echo "Skipping fonts restore."
fi

# Step 5: Restore GNOME Tweaks Settings
if prompt_user "Do you want to restore GNOME Tweaks settings?"; then
    DCONF_FILE="$script_dir/gnome_tweaks_settings_backup.dconf"
    if [ -f "$DCONF_FILE" ]; then
        echo "Restoring GNOME Tweaks settings..."
        dconf load / < "$DCONF_FILE"
        echo "GNOME Tweaks settings restored."
    else
        echo "No GNOME Tweaks settings backup found, skipping."
    fi
else
    echo "Skipping GNOME Tweaks settings restore."
fi

echo "Installation complete!"
