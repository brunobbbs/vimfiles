#!/bin/bash

# Criando link simbolico do arquivo .vimrc
ln -s ~/.vim/.vimrc ~/.vimrc

# Fazendo o checkout dos plugins
echo "Fazendo o checkout dos plugins e esquemas de cores..."
sleep 2
git submodule init
git submodule update --init --recursive

# Inserindo o pep8.vim
echo "Fazendo o download do pep8.vim e configurando-o."
sleep 2
wget http://www.vim.org/scripts/download_script.php?src_id=14366
mv download_script.php\?src_id\=14366 pep8.vim
mv pep8.vim ~/.vim/bundle/pyflakes-vim/ftplugin/python
