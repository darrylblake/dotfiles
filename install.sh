#!/bin/bash
# Creates symlinks from the home directory to dotfiles in ~/dotfiles

dir=~/dotfiles
backup=~/dotfiles_backup
files=".gitconfig .zshrc" 

# Create backup folder
mkdir -p $backup

# Change to the dotfiles directory
cd $dir

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
  echo "Moving any previous dotfiles to $backup"
  mv ~/$file $backup
  echo "Creating symlinks to $file in home directory."
  ln -s $dir/$file ~/$file
done