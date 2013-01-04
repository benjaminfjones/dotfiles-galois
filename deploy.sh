#!/usr/bin/env bash
OS=`uname | grep Darwin`
PWD=`pwd`
MAC_FILES="bashrc bash_profile bash_aliases tmux.conf gitconfig vimrc"
LINUX_FILES="bashrc bash_profile bash_aliases tmux.conf gitconfig Xresources vimrc.linux"
MV_CMD="mv"
LN_CMD="ln"

if [ -z "$OS" ]; then
  echo "We're on a linux"
  FILES=$LINUX_FILES
else
  echo "We're on a MAC"
  FILES=$MAC_FILES
fi

for file in $FILES; do
  FN=`echo $file | sed 's/\.linux//'`
  DOT=$PWD/${file}
  HM=$HOME/.${FN}
  if [ -e $HM ] || [ -h $HM ]; then
    echo "moving existing dotfile $HM to $HM.BAK"
    $MV_CMD $HM $HM.BAK
  fi
  echo "linking $HM -> $DOT"
  $LN_CMD -s $DOT $HM
done

