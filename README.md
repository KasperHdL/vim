# vim
my personal vim settings [completely new to vim would not recommend to anyone]


Install vim

Set Terminal to 256 colors 

in ~/.bashrc


`case $TERM in`

`    xterm|screen|rxvt-unicode)`

`    TERM="${TERM}-256color" ;`

`esac`


Symlink vimrc:
`ln -s /path/to/file /path/to/symlink`

init submodules:
`git submodule update --init --recursive`

install silver surfer for ag
`apt-get install silversearcher-ag`

install ctags
`apt-get install ctags`

