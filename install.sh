#!/usr/bin/env bash

# Get current dir (so run this script from anywhere)
export DOTFILES_DIR DOTFILES_CACHE DOTFILES_EXTRA_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DOTFILES_CACHE="$DOTFILES_DIR/.cache.sh"
DOTFILES_EXTRA_DIR="$HOME/.extra"

# Make utilities available
PATH="$DOTFILES_DIR/bin:$PATH"

# Update dotfiles itself first
if is-executable git -a -d "$DOTFILES_DIR/.git"; then
  git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master;
fi

# Package managers & packages
. "$DOTFILES_DIR/install/brew.sh"
. "$DOTFILES_DIR/install/brew-cask.sh"

# Others
. "$DOTFILES_DIR/install/atom.sh"

# Bunch of symlinks

ln -sfv "$DOTFILES_DIR/git/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/git/.gitignore_global" ~


# Install extra stuff

if [ -d "$DOTFILES_EXTRA_DIR" -a -f "$DOTFILES_EXTRA_DIR/install.sh" ]; then
  . "$DOTFILES_EXTRA_DIR/install.sh"
fi
