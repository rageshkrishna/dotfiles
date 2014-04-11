mkdir -p ~/.vim/bundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
mkdir -p ~/.vim/colors
cp -r colors/* ~/.vim/colors/
cp .vimrc ~/
vim +PluginInstall +qall
