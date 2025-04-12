#!/opt/homebrew/bin/bash

# what i need to install
packages=(
	git
	neovim
	fzf
	cmake
)
casks=(
	alacritty
	firefox
	mactex
	skim
)

# installs
for pkg in "${packages[@]}"; do
	brew install "$pkg"
done

for csk in "${casks[@]}"; do
	brew install --cask "$csk"
done
