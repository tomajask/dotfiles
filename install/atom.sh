ln -sfv "$DOTFILES_DIR/atom" "$HOME/.atom"
apm install --packages-file "$DOTFILES_DIR/atom/packages.list"

# Run `apm list --installed --bare > packages.list` to generate packages list
