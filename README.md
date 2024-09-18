# My GNOME Customization and Dotfiles Backup

This repository contains my dotfiles, GNOME extensions, themes, fonts, and GNOME Tweaks settings, which I use to customize my GNOME desktop environment. Follow this guide to set up your system using my configuration.

## What’s Included

- **Dotfiles**: Configuration files for shell, editors, etc.
- **GNOME Extensions**: A list of installed GNOME extensions.
- **Themes**: GTK, GNOME Shell, and Icon themes.
- **Fonts**: Custom fonts used in my setup.
- **GNOME Tweaks Settings**: All my GNOME customizations (e.g., themes, fonts) via GNOME Tweaks.

#### note that installer script still in development

## How to Use

### 1. Clone the Repository

Start by cloning this repository to your local machine:

```bash
git clone https://github.com/chikobara/gnome-dotfiles
cd gnome-dotfiles
```

### 2. Restore Dotfiles

Dotfiles are configuration files that define how programs like your shell and editors behave. You can restore the dotfiles to your home directory:

```bash
cp -r dotfiles/. ~/
#This will copy files like .bashrc, .zshrc, .vimrc to your home directory. You may want to review the files to make sure the configurations match your preferences.
```

Install dependencies:

```
gnome-shell-extensions
gnome-tweaks
oh my zsh
nvchad
kitty
fastfetch
```

or just copy and paste :)

```bash
yay -S gnome-shell-extensions gnome-tweaks oh-my-zsh-git fastfetch kitty
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
```

### 3. Install GNOME Extensions

GNOME extensions add extra features to your desktop environment. You can install extensions by referencing the list included in the file gnome_extensions_list.txt:

```bash
cat gnome_extensions_list.txt
```

Go to extensions.gnome.org to manually search for and install the extensions in the list.

Alternatively, use the gnome-extensions CLI to install extensions (if supported by your system). For example:

```bash
gnome-extensions install [OPTION…] EXTENSION_BUNDLE
```

### 4. Theme

I use custom themes and icons for GTK, GNOME Shell, and application icons. To restore them:

#### GTK theme 
Available in [Tokyonight-GTK-Theme](https://github.com/Fausto-Korpsvart/Tokyonight-GTK-Theme)

#### Icons
Available in [WhiteSur-icon-theme](https://github.com/vinceliuice/WhiteSur-icon-theme)

#### Cursor

Cursor used Bibata Modern Classic

```bash
yay -S bibata-cursor-theme
```

### 5. Restore Fonts

To use the fonts I’ve installed:

Copy user-specific fonts:

```bash
cp -r .local/share/fonts ~/.local/share/fonts
```

### 6. Apply GNOME Tweaks Settings

My GNOME desktop is customized using GNOME Tweaks. To apply the same settings, you can load the dconf configuration:

```bash
dconf load / < gnome_tweaks_settings_backup.dconf
```

This will restore the appearance settings, fonts, and other GNOME Tweaks configurations to match my setup.

#### Optional: Modify Dotfiles

### Additional Notes

Dependencies: Some themes or settings might require specific packages or software to be installed (e.g., zsh, oh-my-zsh, specific GTK engines). Make sure to install these dependencies if needed.
Fonts: If you are missing any fonts after restoring, install the relevant font packages from your package manager.
Themes: You may need to use GNOME Tweaks or dconf to apply themes, icons, and fonts manually.

### Customizing Further

If you’d like to add your own configurations or tweak my setup, you can modify the dotfiles, themes, and configurations included here. If you make significant changes, consider forking this repository and pushing your changes to your own version for personal backups or to share with others.

Enjoy your newly customized GNOME setup!
