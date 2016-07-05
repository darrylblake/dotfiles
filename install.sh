#!/bin/bash
# # Creates symlinks from the home directory to dotfiles in ~/dotfiles

dir=~/dotfiles
backup=~/dotfiles_backup
files=".gitconfig .zshrc"

# Create backup folder
mkdir -p $backup

# Change to the dotfiles directory
cd $dir

# Delete old backup
rm -ri $backup


# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
  echo "Moving any previous dotfiles to $backup"
  mv ~/$file $backup
  echo "Creating dotfile symlinks..."
  ln -s $dir/$file ~/$file
done

# Sublime
dirSublimePackages=/Users/darryl/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/
sublimeFiles="Preferences.sublime-settings"

for file in $sublimeFiles; do
  echo "Moving any previous files to $backup"
  mv "$dirSublimePackages/$file" $backup
  echo "Creating Sublime Text symlinks..."
  ln -s $dir/$file "$dirSublimePackages/$file"
done