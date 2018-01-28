if ! is-macos -o ! is-executable ruby -o ! is-executable curl -o ! is-executable git; then
  echo "Skipped: Homebrew (missing: ruby, curl and/or git)"
  return
fi

# Ask for the administrator password upfront
sudo -v

echo "Installing Homebrew..."
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Add homebrew's services repositories
brew tap homebrew/services
# Fetch the newest version of Homebrew from GitHub using git(1).
brew update
# Upgrade outdated, unpinned brews (with existing install options).
brew upgrade


# Install packages
apps=(
  coreutils
  fasd
  ffmpeg
  findutils
  git
  gnu-sed --with-default-names
  grep --with-default-names
  htop
  httpie
  hub
  imagemagick
  nano
  openssh
  openssl
  postgresql
  python
  tree
  wget
)

brew install "${apps[@]}"

export DOTFILES_BREW_PREFIX_COREUTILS=`brew --prefix coreutils`
set-config "DOTFILES_BREW_PREFIX_COREUTILS" "$DOTFILES_BREW_PREFIX_COREUTILS" "$DOTFILES_CACHE"

# Remove outdated versions from the cellar.
brew cleanup
