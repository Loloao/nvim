set rnu
set nu

let mapleader='<space>'
inoremap <leader>w <Esc>:w<cr>
inoremap jj <Esc>

" 设置 tab 缩进
set ts=2
set expandtab
set autoindent

inoremap jj <Esc>

" 设置 tab 缩进
set ts=2
set expandtab

source $HOME/.config/nvim/vim-plug/plugins.vim

"nodetree 快捷键
nnoremap <>v :NERDTreeFind<cr>
nnoremap <leader>g :NERDTreeToggle<cr>
" 显示隐藏文件
let NERDTreeShowHidden = 1

