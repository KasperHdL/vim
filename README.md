# vim
my personal vim settings [completely new to vim would not recommend to anyone]

install the_silver_searcher and ctags and vim

clone repo and rename to .vim

Symlink vimrc:
`ln -s ~/.vim/vimrc ~/.vimrc`

init submodules:
`git submodule update --init --recursive`




Set Terminal to 256 colors if not already 

in ~/.bashrc


`case $TERM in`

`    xterm|screen|rxvt-unicode)`

`    TERM="${TERM}-256color" ;`

`esac`
