#!/bin/sh

DOT_FILES=( 
  .bash_profile 
  .bashrc 
  .gnuplot 
  .vimrc 
  .vim
  .ctags.d
  .gitignore_global
  )

for file in ${DOT_FILES[@]}
do
  if [ -a $HOME/$file ]; then
    if [ -L $HOME/$file ]; then
      echo "既にシンボリックリンクが存在します.: $file"
    elif [ -d $HOME/$file ]; then
      echo "既にディレクトリが存在します. : $file"
    else
      echo "既存ファイルが存在します。: $file"
    fi
  else
    ln -s $HOME/dotfiles/$file $HOME/$file
    echo "シンボリックリンクを張りまして: $file"
  fi
done

git config --global core.excludesfile ~/.gitignore_global

echo "終わり"


