#!/bin/bash

if ! is-macos -o ! is-executable brew; then
  echo "Skipped: Homebrew-Cask"
  return
fi

# Install Caskroom
brew tap caskroom/cask
brew install brew-cask
brew tap caskroom/versions

# Install packages
apps=(
  1password
  adobe-acrobat-reader
  atom
  docker
  dropbox
  firefox
  github-desktop
  google-chrome
  iterm2
  java
  opera
  slack
  spectacle
  spotify
  teamviewer
  virtualbox
  viscosity
  visual-studio-code
  vlc
  zoomus
)

brew cask install "${apps[@]}"
