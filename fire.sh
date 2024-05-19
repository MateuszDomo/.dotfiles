#!/bin/bash

dir=~/.dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory

things="i3"



echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

for thing in $things; do
	echo $thing
	echo "Moving any existing dotfiles from ~ to $olddir"
	mv ~/.config/$thing ~/dotfiles_old/
	echo "Creating symlink to $thing in home directory."
	ln -s $dir/$thing ~/.config/$thing
done
