#!/bin/bash

script_dir="$(pwd)"


copy_item() {
    if [ -e "$1" ]; then
        rsync -a --delete "$1" "$2"
        echo "Updated: $1"
    else
        echo "Not found: $1"
    fi
}

# Step 1: Backup Dotfiles
echo "Backing up dotfiles..."


echo "Backup zsh configs"
copy_item "$HOME/.zshrc" "$script_dir/"
copy_item "$HOME/.zprofile" "$script_dir/"
copy_item "$HOME/.zshenv" "$script_dir/"
copy_item "$HOME/.zsh" "$script_dir/"
copy_item "$HOME/.config/zshrc.d" "$script_dir/.config/"

echo
echo "Backup Kitty config"
copy_item "$HOME/.config/kitty" "$script_dir/.config/"

# Backup fastfetch conf
echo
echo "Backup fastfetch conf"
copy_item "$HOME/.fastfetch_conf.jsonc" "$script_dir/"


# Backup p10k and oh-my-zsh
copy_item "$HOME/.oh-my-zsh" "$script_dir/"
copy_item "$HOME/.p10k.zsh" "$script_dir/"


# Step 2: Backup GNOME Extensions
echo "Backing up GNOME extensions..."
gnome-extensions list > "$script_dir/gnome_extensions_list.txt"

# Step 3: Backup GNOME Themes and Icons
echo "Backing up themes and icons..."
# Backup user-specific themes and icons
copy_item "$HOME/.themes" "$script_dir/"

# Step 4: Backup Fonts
echo "Backing up fonts..."
# Backup user-specific fonts
copy_item "$HOME/.local/share/fonts" "$script_dir/.local/share/"
copy_item "$HOME/.fonts" "$script_dir/"


# Step 5: Backup GNOME Tweaks Settings
echo "Backing up GNOME Tweaks settings..."
dconf dump / > "$script_dir/gnome_tweaks_settings_backup.dconf"

echo "Backup complete! Files are saved in $script_dir"