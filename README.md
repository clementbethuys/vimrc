vimrc
=====

Use homesick to install
Then install vundle as below
```
mkdir -p ~/.vim/bundle
cd ~/.vim/bundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/vundle
```

Install Vundle packages
```
# enter vim
:BundleInstall
```

Install native package
```
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer
```
